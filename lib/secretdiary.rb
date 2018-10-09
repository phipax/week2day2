class ChangeSecretDiary
  attr_reader :diarystate
  attr_reader :diarycontents
  attr_reader :p

 def initialize
   @p = ProtectSecretDiary.new
   @diarystate = p.lock
   @diarycontents = ""
 end

 def add_entry(entry)
   puts @diarystate
   raise "Diary locked" unless @diarystate
   @diarycontents << entry
   "Entry '#{@diarycontents}' added successfully"
 end

 def get_entries
  raise "Diary locked" unless @diarystate
  @diarycontents
 end

 def diarystate
   if(!@diarystate)
     @diarystate = @p.unlock
   else
     @diarystate = @p.lock
   end
 end

end

class ProtectSecretDiary
  def unlock
    return true
  end
  def lock
    return false
  end
end

# class DisplayContents
# end
