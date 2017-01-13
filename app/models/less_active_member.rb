class LessActiveMember < ActiveRecord::Base
  include Common
  
  acts_as_ordered_taggable

  attr_accessor :name_changed, :moved, :moved_out_of_state, :died
  attr_accessor :tags, :new_note, :author_id

  before_save :set_tags, :add_note

  scope :no_current_address, -> { where(current_address: nil) }
  scope :no_reference, -> { where(['reference is ? or reference = ?', nil, '']) }
  scope :no_new_address, -> { where(['new_address is ? or new_address = ?', nil, '']) }

  private

  def set_tags
    self.tag_list = self.tags.join(", ") unless self.tags.nil?
  end
  
  def add_note
    unless self.new_note.empty?
      attrs = {body: self.new_note}
      attrs.merge!({author_id: self.author_id}) unless self.author_id.nil?
      self.notes << Note.new(attrs)
    end
  end
  
end
