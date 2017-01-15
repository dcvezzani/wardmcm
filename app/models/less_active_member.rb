class LessActiveMember < ActiveRecord::Base
  include Common
  
  acts_as_ordered_taggable

  attr_accessor :name_changed, :moved, :moved_out_of_state, :died
  attr_accessor :tags, :new_note, :author_id

  before_save :set_tags, :add_note

  scope :no_current_address, -> { where(current_address: nil) }
  scope :no_reference, -> { where(['reference is ? or reference = ?', nil, '']) }
  scope :no_new_address, -> { where(['new_address is ? or new_address = ?', nil, '']) }

  scope :no_move_ids_sql, -> { select("less_active_members.id").joins(:taggings => :tag).where(["tags.name not in (?)", %w{moved moved_out_of_ward moved_out_of_state}]).select("less_active_members.id").to_sql }

  scope :move_ids_sql, -> { select("less_active_members.id").joins(:taggings => :tag).where(["tags.name in (?)", %w{moved moved_out_of_ward moved_out_of_state}]).select("less_active_members.id").to_sql }
  scope :no_move_ids_sql, -> { select("less_active_members.id").where(["less_active_members.id not in (#{move_ids_sql})"]).select("less_active_members.id").to_sql }
  scope :no_tag_ids_sql, -> { "select less_active_members.id from less_active_members where not exists (select 1 from taggings where taggings.taggable_id = less_active_members.id and taggings.taggable_type = 'LessActiveMember')" }

  scope :moved, -> { joins(:taggings => :tag).where(["tags.name = ?", 'moved']) }
  scope :no_change, -> { where("id in (select id from (#{no_move_ids_sql}) q1 union select id from (#{no_tag_ids_sql}) q2)") }
  scope :new_ward, -> { joins(:taggings => :tag).where(["tags.name = ?", 'moved_out_of_ward']) }
  scope :new_state, -> { joins(:taggings => :tag).where(["tags.name = ?", 'moved_out_of_state']) }
  scope :died, -> { joins(:taggings => :tag).where(["tags.name = ?", 'died']) }

  # LessActiveMember.joins(:taggings => :tag).count
  # LessActiveMember.joins(:taggings => :tag).where(["tags.name = ?", 'moved']).count

  private

  def set_tags
    self.tag_list = self.tags.join(", ") unless self.tags.nil?
  end
  
  def add_note
    unless self.new_note.blank?
      attrs = {body: self.new_note}
      attrs.merge!({author_id: self.author_id}) unless self.author_id.nil?
      self.notes << Note.new(attrs)
    end
  end
end
