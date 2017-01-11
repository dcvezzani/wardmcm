class LessActiveMemberNames
  include ActiveModel::Model

  attr_accessor :names
  validates :names, presence: true

  def save
    mutation = nil
    lines = names.split(/[\r\n]+/)

    LessActiveMember.transaction do
      begin
        lines.each do |name|
          name_parts = name.split(/ +/)
          surname = name_parts.pop
          given_name = name_parts.join(" ")

          mutation = LessActiveMemberNameCreate.run({surname: surname, given_name: given_name})
          if(mutation.success?)
            LessActiveMember.create(mutation.result)
          end
        end
        return true

      rescue => e
        self.errors.add(:surname, "Unable to process mutations: #{mutation.errors.to_json}")
        return false
      end
    end
  end
end
