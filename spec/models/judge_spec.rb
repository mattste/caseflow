describe Judge do
  before do
    Timecop.freeze(Time.utc(2017, 2, 2))
    Time.zone = "America/Chicago"
  end

  context ".upcoming_dockets" do
    subject { Judge.new(user).upcoming_dockets }

    let(:user) { Generators::User.create }
    let!(:hearing)            { Generators::Hearing.create(user: user, date: 1.day.from_now) }
    let!(:hearing_same_date)  { Generators::Hearing.create(user: user, date: 1.day.from_now + 2.hours) }
    let!(:hearing_later_date) { Generators::Hearing.create(user: user, date: 3.days.from_now) }
    let!(:hearing_another_judge) { Generators::Hearing.create(user: Generators::User.create, date: 2.days.from_now) }

    it "returns a hash of hearing dockets indexed by date" do
      keys = subject.keys.sort

      expect(keys.length).to eq(2)

      expect(keys.first.to_date).to eq(1.day.from_now.to_date)
      expect(subject[keys.first].hearings.first).to eq(hearing)

      expect(keys.last.to_date).to eq(3.days.from_now.to_date)
      expect(subject[keys.last].hearings.first).to eq(hearing_later_date)
    end

    it "returns dockets with hearings grouped by date" do
      keys = subject.keys.sort

      # to_date() normalizes on YYYY-MM-DD
      first_dates = subject[keys.first].hearings.map { |hash| hash.date.to_date }
      last_dates = subject[keys.last].hearings.map { |hash| hash.date.to_date }

      expect(first_dates).to all(eq(keys.first.to_date))
      expect(last_dates).to all(eq(keys.last.to_date))
    end

    it "excludes hearings for another judge" do
      hearing_ids = subject.map { |key, _v| subject[key].hearings.map(&:id) }.flatten
      expect(hearing_ids).to_not include(hearing_another_judge.id)
    end
  end
end
