class LessActiveMemberDecorator < Draper::Decorator
  delegate_all

  ANCHOR_BASE = '/Users/davidvezzani/Documents/member-contact-information'

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def name
    "#{object.surname}, #{object.given_name}"
  end

  def current_address
    helpers.raw(object.current_address.split(/[\r\n]+/).join('<br/>')) unless object.current_address.nil?
  end

  def new_address
    helpers.raw(object.new_address.split(/[\r\n]+/).join('<br/>')) unless object.new_address.nil?
  end

  def references
    helpers.raw(object.reference.split(/[\r\n]+/).map{|ref| "<li>#{helpers.link_to ref, ref, {target: '_new'}}</li>"}.join("\n")) unless(object.reference.blank?)
  end

  def resources_raw
    object.resources
  end

  def slug
    "#{object.given_name} #{object.surname}".gsub(/[^a-zA-Z0-9]/, '-')
  end

  def anchor_base
    ANCHOR_BASE
  end

  def fuzzy_resources
    possible_matches = []

    if true or object.resources.blank?
      file_list = Dir.glob("#{anchor_base}/*")
      full_name = "#{object.given_name} #{object.surname}"
      full_name_terms = "#{object.given_name} #{object.surname}".split(/ +/)
      possible_matches = file_list.select{|x| x =~ /#{full_name_terms.join("|")}/i}

      possible_matches = possible_matches.map{|x| x.gsub(/#{anchor_base}\//, '')}
    end
  end

  def resources
    if object.resources.blank?
      file_list = Dir.glob("#{anchor_base}/*")
      full_name = "#{object.given_name} #{object.surname}"
      full_name_terms = "#{object.given_name} #{object.surname}".split(/ +/)
      possible_matches = file_list.select{|x| x =~ /#{full_name}/}

      possible_matches = possible_matches.map{|x| x.gsub(/#{anchor_base}\//, '')}
      object.update_attribute(:resources, possible_matches.join("\n"))
    end

    helpers.raw(object.resources.split(/[\r\n]+/).map.with_index{|ref, idx| 
      "<li>#{helpers.link_to ref, helpers.less_active_member_resource_url(object, idx, "#{self.slug}.pdf"), {target: '_new'}}</li>"
    }.join("\n")) unless(object.resources.blank?)
  end

  private

  def rename_pdf(pdf_file, title)
    `exiftool -Title="#{title}" #{pdf_file}`
  end
  
end
