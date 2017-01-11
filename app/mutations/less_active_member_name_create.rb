class LessActiveMemberNameCreate < Mutations::Command
  include MutationsHelper

  required do
    string :surname, max_length: 255
    string :given_name, max_length: 255
  end

  def execute
    attrs = {
      surname: clean(surname, :clean_string, :capitalize_string), 
      given_name: clean(given_name, :clean_string, :capitalize_string)
    }
    attrs
  end  

  private

end  

