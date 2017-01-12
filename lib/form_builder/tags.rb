module FormBuilder
  class Tags < SimpleForm::FormBuilder
    def status_tags(attribute, options={})
      tag_values = [
        OpenStruct.new({id: :name_changed, value: :name_changed}), 
        OpenStruct.new({id: :moved, value: :moved}), 
        OpenStruct.new({id: :moved_out_of_state, value: :moved_out_of_state}), 
        OpenStruct.new({id: :died, value: :died})
      ]

      @template.content_tag('div', {class: 'form-group string optional less_active_member_tag_list'}){
        collection_check_boxes(:tag_list, tag_values, :id, :value) do |b|
            b.check_box(class: "check_box", checked: ( @object.tag_list.include?(b.object.value.to_s))) +
            @template.content_tag('span', class: 'tag_label'){ b.object.value.to_s }
        end      
      }
    end
  end
end
