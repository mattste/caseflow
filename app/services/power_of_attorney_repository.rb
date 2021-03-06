class PowerOfAttorneyRepository
  include PowerOfAttorneyMapper

  # :nocov:
  def self.poa_query(poa)
    VACOLS::Case.includes(:representative).find(poa.vacols_id)
  end
  # :nocov:

  # returns either the data or false
  def self.load_vacols_data(poa)
    case_record = MetricsService.record("VACOLS POA: load_vacols_data #{poa.vacols_id}",
                                        service: :vacols,
                                        name: "PowerOfAttorneyRepository.load_vacols_data") do
      poa_query(poa)
    end

    set_vacols_values(poa: poa, case_record: case_record)

    true
  rescue ActiveRecord::RecordNotFound
    return false
  end

  def self.set_vacols_values(poa:, case_record:)
    rep_info = get_poa_from_vacols_poa(
      vacols_code: case_record.bfso,
      representative_record: case_record.representative
    )

    poa.assign_from_vacols(
      vacols_representative_type: rep_info[:representative_type],
      vacols_representative_name: rep_info[:representative_name]
    )
  end

  def self.get_vacols_rep_code(short_name)
    VACOLS::Case::REPRESENTATIVES.each do |representative|
      return representative[0] if representative[1][:short] == short_name
    end
    nil
  end

  # :nocov:
  def self.update_vacols_rep_type!(case_record:, vacols_rep_type:)
    VACOLS::Representative.update_vacols_rep_type!(bfkey: case_record.bfkey, rep_type: vacols_rep_type)
  end

  def self.update_vacols_rep_name!(case_record:, first_name:, middle_initial:, last_name:)
    VACOLS::Representative.update_vacols_rep_name!(
      bfkey: case_record.bfkey,
      first_name: first_name[0, 24],
      middle_initial: middle_initial[0, 4],
      last_name: last_name[0, 40]
    )
  end

  def self.update_vacols_rep_address!(case_record:, address:)
    VACOLS::Representative.update_vacols_rep_address!(
      bfkey: case_record.bfkey,
      address: {
        address_one: address[:address_one][0, 50],
        address_two: address[:address_two][0, 50],
        city: address[:city][0, 20],
        state: address[:state][0, 4],
        zip: address[:zip][0, 10]
      }
    )
  end
  # :nocov:

  # TODO: Consider changing this logic. Move the entire name into one field.
  def self.update_vacols_rep_table!(appeal:, representative_name:, address:)
    first, middle, last = split_representative_name(representative_name)
    update_vacols_rep_name!(
      case_record: appeal.case_record,
      first_name: first,
      middle_initial: middle,
      last_name: last
    )

    address_one, address_two = get_address_one_and_two(representative_name, address)
    update_vacols_rep_address!(
      case_record: appeal.case_record,
      address: {
        address_one: address_one,
        address_two: address_two,
        city: address[:city] || "",
        state: address[:state] || "",
        zip: address[:zip] || ""
      }
    )
  end

  def self.get_address_one_and_two(representative_name, address)
    # for non-person representative name, put the name in REP.REPADDR1
    # then all 3 BGS addresses go to REP.REPADDR2
    address_one = representative_name
    address_two = address.values_at(:address_line_1, :address_line_2, :address_line_3)

    # if representative is a person, BGS address line 1 should be used to populate
    # VACOLS REP.REPADDR1.
    # concatenate BGS address line 2 and address line 3 and use them to populate REP.REPADDR2.
    if representative_is_person?(representative_name)
      address_one = address[:address_line_1]
      address_two = address.values_at(:address_line_2, :address_line_3)
    end

    [address_one || "", address_two.join(" ").strip]
  end

  def self.split_representative_name(representative_name)
    return "", "", "" unless representative_is_person?(representative_name)
    split_name = representative_name.strip.split(" ")

    return split_name[0], "", split_name[1] if first_last_name?(representative_name)

    [split_name[0], split_name[1], split_name[2]]
  end

  def self.first_last_name?(representative_name)
    representative_name.strip.split(" ").length == 2 && !representative_name.include?("&")
  end

  def self.first_middle_last_name?(representative_name)
    split_representative_name = representative_name.strip.split(" ")
    split_representative_name.length == 3 && split_representative_name[1].tr(".", "").length == 1
  end

  def self.representative_is_person?(representative_name)
    first_last_name?(representative_name) || first_middle_last_name?(representative_name)
  end
end
