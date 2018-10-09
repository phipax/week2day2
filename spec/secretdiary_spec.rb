require 'secretdiary'

describe ChangeSecretDiary do
  it "Check for the class object -- ChangeSecretDiary" do
    expect(ChangeSecretDiary.new).to be_a(ChangeSecretDiary)
  end

  it "Check for Lock Method" do
    s = ChangeSecretDiary.new
    expect(s.p.lock).to eq(false)
  end

  it "Check for unlock Method" do
    s = ChangeSecretDiary.new
    expect(s.p.unlock).to eq(true)
  end

  describe "#add_entry" do
    it "Invoking without unlocking with throw error" do
      s = ChangeSecretDiary.new
      expect{s.add_entry("hello diary")}.to raise_error("Diary locked") if(!@diarystate)
    end

    it "Invoking after unlocking displays success message" do
      s = ChangeSecretDiary.new
      s.diarystate = s.p.unlock
      expect(s.add_entry("hello diary")).to eq "Entry 'hello diary' added successfully"
    end
  end

  describe "#get_entries" do
    it "Getting entries without unlocking throws error" do
      s = ChangeSecretDiary.new
      expect{s.get_entries}.to raise_error("Diary locked") if(!@diarystate)
    end
    it "Getting entries work after unlocking" do
      s = ChangeSecretDiary.new
      s.diarystate = s.p.unlock
      expect(s.get_entries).to eq s.diarycontents
    end
  end
end
