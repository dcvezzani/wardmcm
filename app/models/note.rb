class Note < ActiveRecord::Base
  audited
  belongs_to :notable, polymorphic: true
end
