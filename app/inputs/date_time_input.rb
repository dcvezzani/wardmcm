class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  def input(wrapper_options)
    template.content_tag(:div) do
      [template.content_tag(:input, nil, {id: "#{self.object_name}_#{self.attribute_name}_date", class: 'form-control datetime optional', name: "#{self.object_name}[#{self.attribute_name}][date]"}), 
       template.content_tag(:input, nil, {id: "#{self.object_name}_#{self.attribute_name}_time", class: 'form-control timetime optional', name: "#{self.object_name}[#{self.attribute_name}][time]"})].join("\n").html_safe
    end
  end
end
