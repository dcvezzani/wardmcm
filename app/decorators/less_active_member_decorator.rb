class LessActiveMemberDecorator < Draper::Decorator
  delegate_all

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
end
