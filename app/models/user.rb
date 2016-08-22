class User < ActiveRecord::Base
  ROLES = %w[admin member guest banned].freeze

  has_many :contact_infos
  has_many :email_addresses, class_name: 'Email'
  has_many :phone_numbers, class_name: 'Phone'
  has_many :callings, class_name: 'Calling'
  has_many :requested_tasks, foreign_key: :assigned_by_id, class_name: 'Task'
  has_many :assignments, foreign_key: :assigned_to_id
  has_many :tasks, through: :assignments
  has_many :notes, as: :notable

  def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid).to_hash).first_or_initialize.tap do |user|

      User.transaction do
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)

        user.contact_infos << Email.create(name: 'facebook', value: auth.info.email)

        user.save!
      end
    end
  end

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end  

  def is?(role)
    roles.include?(role.to_s)
  end  
end
