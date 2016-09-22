class ContactInfo < ActiveRecord::Base
  audited
  belongs_to :user
end
