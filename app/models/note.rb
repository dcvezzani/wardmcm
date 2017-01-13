class Note < ActiveRecord::Base
  audited
  belongs_to :notable, polymorphic: true
  belongs_to :author, class_name: "User"
end
