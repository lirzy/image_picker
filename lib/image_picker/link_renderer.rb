if defined?(WillPaginate)
  module ImagePicker
    class LinkRenderer < WillPaginate::LinkRenderer
      def page_link(page, text, attributes = {})
        @template.link_to_function text, "ImagePicker.open_picker({field:$('target_field').value, page:'#{page}', url:$('image_picker_url').value});"
      end
    end
  end
end
