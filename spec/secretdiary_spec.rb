require 'secretdiary'

describe ChangeSecretDiary do
  it "Check for the class object -- ChangeSecretDiary" do
    expect(ChangeSecretDiary.new).to be_a(ChangeSecretDiary)
  end

  it "Check for Lock Method" do
    s = ChangeSecretDiary.new
    s.lock
    expect(s.diarystate).to eq(false)
  end

  it "Check for unlock Method" do
    s = ChangeSecretDiary.new
    s.unlock
    expect(s.diarystate).to eq(true)
  end

  describe "#add_entry" do
    it "Invoking without unlocking with throw error" do
      expect{subject.add_entry("hello diary")}.to raise_error("Diary locked") if subject.diarystate == false
    end

    it "Invoking after unlocking displays success message" do
      subject.unlock
      expect(subject.add_entry("hello diary")).to eq "Entry 'hello diary' added successfully"
    end
  end

  describe "#get_entries" do
    it "Getting entries without unlocking throws error" do
      expect{subject.get_entries}.to raise_error("Diary locked") if subject.diarystate == false
    end
    it "Getting entries work after unlocking" do
      subject.unlock
      expect(subject.get_entries).to eq subject.diarycontents
    end


  end

end
