class LessActiveMember < ActiveRecord::Base
  acts_as_ordered_taggable

  attr_accessor :name_changed, :moved, :moved_out_of_state, :died
  attr_accessor :tags

  before_save :set_tags

  scope :no_current_address, -> { where(current_address: nil) }
  scope :no_reference, -> { where(['reference is ? or reference = ?', nil, '']) }
  scope :no_new_address, -> { where(['new_address is ? or new_address = ?', nil, '']) }

  private

  def set_tags
    self.tag_list = self.tags.join(", ") unless self.tags.nil?
  end
  
end
