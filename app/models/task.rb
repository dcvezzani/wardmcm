class Task < ActiveRecord::Base
  belongs_to :requester, foreign_key: :assigned_by_id, class_name: 'User'
  has_many :assignments
  has_many :owners, through: :assignments, foreign_key: :assigned_to_id
  has_many :notes, as: :notable
end
