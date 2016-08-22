class Assignment < ActiveRecord::Base
  include Common
  belongs_to :task
  belongs_to :owner, class_name: 'User', foreign_key: :assigned_to_id
end
