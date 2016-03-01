# frozen_string_literal: true
require "pdf_forms"

class Form8PdfService
  PDF_LOCATION_PREFIX = "form1[0].#subform[0].#area[0].".freeze

  FIELD_LOCATIONS = {
    appellant_name: "TextField1[0]",
    appellant_relationship: "TextField1[1]",
    file_number: "TextField1[2]",
    veteran_name: "TextField1[3]",
    insurance_loan_number: "TextField1[4]",
    service_connection_for: "TextField1[5]",
    service_connection_nod_date: "TextField1[6]",
    increased_rating_for: "TextField1[7]",
    increased_rating_nod_date: "TextField1[8]",
    other_for: "TextField1[9]",
    other_nod_date: "TextField1[10]",
    representative: "TextField1[11]",
    power_of_attorney_file: "TextField1[12]",
    power_of_attorney: {
      "POA" => "CheckBox21[0]",
      "Certification that valid POA is in another VA file" => "CheckBox21[1]"
    },
    agent_accredited: {
      "Yes" => "CheckBox23[0]",
      "No" => "CheckBox23[1]"
    },
    form_646_of_record: {
      "Yes" => "CheckBox23[2]",
      "No" => "CheckBox23[3]"
    },
    form_646_not_of_record_explaination: "TextField1[13]",
    hearing_requested: {
      "Yes" => "CheckBox23[4]",
      "No" => "CheckBox23[5]"
    },
    hearing_transcript_on_file: {
      "Yes" => "CheckBox23[6]",
      "No" => "CheckBox23[7]"
    },
    hearing_requested_explaination: "TextField1[14]",
    contested_claims_procedures_applicable: {
      "Yes" => "CheckBox23[8]",
      "No" => "CheckBox23[9]"
    },
    contested_claims_requirements_followed: {
      "Yes" => "CheckBox23[10]",
      "No" => "CheckBox23[11]"
    },
    soc_date: "TextField1[15]",
    ssoc_required: {
      "Required and furnished" => "CheckBox23[12]",
      "Not required" => "CheckBox23[13]"
    },
    record_cf_or_xcf: "CheckBox23[14]",
    record_inactive_cf: "CheckBox23[19]",
    record_dental_f: "CheckBox23[25]",
    record_r_and_e_f: "CheckBox23[15]",
    record_training_sub_f: "CheckBox23[20]",
    record_loan_guar_f: "CheckBox23[16]",
    record_outpatient_f: "CheckBox23[17]",
    record_hospital_cor: "CheckBox23[22]",
    record_clinical_rec: "CheckBox23[26]",
    record_x_rays: "CheckBox23[18]",
    record_slides: "CheckBox23[23]",
    record_tissue_blocks: "CheckBox23[27]",
    record_dep_ed_f: "CheckBox23[24]",
    record_insurance_f: "CheckBox23[21]",
    record_other: "CheckBox23[28]",
    record_other_explaination: "TextField1[16]",
    remarks: "TextField1[17]",
    certifying_office: "TextField1[18]",
    certifying_username: "TextField1[19]",
    certifying_official_name: "TextField1[20]",
    certifying_official_title: "TextField1[21]",
    certification_date: "TextField1[22]"
  }.freeze

  PDF_CHECKBOX_SYMBOL = "1".freeze

  def self.pdf_values_for(form8)
    FIELD_LOCATIONS.each_with_object({}) do |(attribute, location), pdf_values|
      next pdf_values unless (value = form8.send(attribute))

      if location.is_a?(Hash)
        location = location[value]
        value = PDF_CHECKBOX_SYMBOL
      end

      location = PDF_LOCATION_PREFIX + location

      pdf_values[location] = value
    end
  end

  def self.save_pdf_for!(form8)
    pdf_forms.fill_form(
      empty_pdf_location,
      tmp_location_for(form8),
      pdf_values_for(form8),
      flatten: true
    )

    # Run it through `pdftk cat`. The reason for this is that editable PDFs have
    # an RSA signature on them which proves they are genuine. pdftk tries to
    # maintain the editability of a PDF after processing it, but then the
    # signature doesn't match. The result is that (without `pdftk cat`) Acrobat
    # shows a warning (other PDF viewers don't care).
    pdf_forms.call_pdftk(
      tmp_location_for(form8),
      "cat",
      "output",
      output_location_for(form8)
    )

    # Remove it from the tmp_location, leaving it only in final_location
    File.delete(tmp_location_for(form8))
  end

  def self.output_location_for(form8)
    File.join(Rails.root, "tmp", "pdfs", "form8-#{form8.id}.pdf")
  end

  def self.tmp_location_for(form8)
    File.join(Rails.root, "tmp", "pdfs", "form8-#{form8.id}.tmp")
  end

  def self.empty_pdf_location
    File.join(Rails.root, "lib", "pdfs", "VA8.pdf")
  end

  def self.pdf_forms
    @pdf_forms ||= PdfForms.new("pdftk")
  end
end