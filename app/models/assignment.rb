class Assignment < ActiveRecord::Base
  belongs_to :task
  belongs_to :owner, class_name: 'User', foreign_key: :assigned_to_id
end
