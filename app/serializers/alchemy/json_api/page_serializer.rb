module Alchemy
  module JsonApi
    class PageSerializer
      include FastJsonapi::ObjectSerializer
      attributes(
        :name,
        :urlname,
        :page_layout,
        :title,
        :language_code,
        :meta_keywords,
        :meta_description,
        :created_at,
        :updated_at,
      )

      has_many :elements
      has_many :all_elements, record_type: :element, serializer: ElementSerializer

      with_options if: -> (_, params) { params[:admin] == true } do
        attribute :tag_list
        attribute :status
      end
    end
  end
end
