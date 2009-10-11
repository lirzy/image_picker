module ImagePicker
  def image_picker(field, current_image=nil)
    url = url_for :action => "open_picker"
    html = stylesheet_link_tag "modalbox"
    html += javascript_include_tag :defaults, "image_picker", "modalbox"
    html += link_to_function image_tag(current_image ? current_image.thumbnail : "no_image.jpg", :id => field), "ImagePicker.open_picker({field:'#{field}', url:'#{url}'})"
    html += hidden_field_tag "#{field}", (current_image ? current_image.id : '')
  end
    
  def image_picker_includes
    javascript_include_tag( 'modalbox', 'image_picker') <<
	stylesheet_link_tag('modalbox')
  end
end

ActionView::Base.send :include, ImagePicker


module ImagePickerTagHelper
  include ActionView::Helpers
  
  def image_picker_field(method, image_record=nil, options = {})
    url = @template.url_for :action => "open_picker"
	options[:value] ||= image_record.id if image_record
    hidden_field_html = @template.hidden_field(@object_name, "#{method}_id", objectify_options(options))
	
	image_tag = InstanceTag.new(@object_name, method, self)
	image_tag.send(:add_default_name_and_id, options)
	options.merge!(:src=>image_record.thumbnail)
	image_tag_html = image_tag.to_content_tag("img", options)
	
	link_html = link_to_function image_tag_html, "ImagePicker.open_picker({field:'#{options["id"]}', url:'#{url}'})"
	
	[hidden_field_html,  link_html].join("\n")
  end

end

ActionView::Helpers::FormBuilder.send :include, ImagePickerTagHelper

