module UsersHelper
  def show_info_items(label, collection)
    info_items = content_tag(:ul) do
      raw(collection.map do |info_item|
        content_tag :li, "#{info_item.name}: #{info_item.value}"
      end.join("\n"))
    end
    
    content_tag(:strong, "#{label}:") + info_items
  end
end
