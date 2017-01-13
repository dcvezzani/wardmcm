class LessActiveMemberCreate < Mutations::Command
  include MutationsHelper

  required do
    string :surname, max_length: 255
    string :given_name, max_length: 255
    string :current_address, max_length: 4000
  end

  optional do
    integer :current_user_id, empty: true
    string :new_phone, max_length: 255, empty: true
    string :new_address, max_length: 4000, empty: true
    string :reference, max_length: 4000, empty: true
    array :tag_list, class: String
    string :new_note, max_length: 4000, empty: true
  end

  def execute
    attrs = {
      surname: clean(surname, :clean_string, :capitalize_first_char), 
      given_name: clean(given_name, :clean_string, :capitalize_string), 
      current_address: clean(current_address, :clean_string){[:capitalize_string, :uppercase_state, :segregate_phone]}, 
    }

    attrs.merge!({ new_phone: clean_string(new_phone) }) unless new_phone.nil?
    attrs.merge!({ new_address: clean(new_address, :clean_string){[:capitalize_string, :uppercase_state, :segregate_phone]} }) unless new_address.nil?
    attrs.merge!({ reference: clean_string(reference) }) unless reference.nil?
    attrs.merge!({ new_note: new_note }) unless new_note.nil?
    attrs.merge!({ author_id: current_user_id }) unless current_user_id.nil?

    attrs.merge!({ tags: tag_list })
    
    attrs
  end  

  private

  def segregate_phone(str)
    md = str.match(/^(.+ +[0-9-]+) +([0-9-]+)( *$)/)
    if md
      "#{md[1]}\n#{md[2].upcase}#{md[3]}"
    else
      str
    end
  end

  def uppercase_state(str)
    md = str.match(/^(.+ )([a-zA-Z]{2,2})( +[0-9]+.*$)/)
    if md
      "#{md[1]}#{md[2].upcase}#{md[3]}"
    else
      str
    end
  end
end
