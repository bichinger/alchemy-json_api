# frozen_string_literal: true
module Alchemy
  module JsonApi
    module Admin
      class PagesController < JsonApi::PagesController
        def show
          render jsonapi: Alchemy::JsonApi::Page.new(@page, page_version: :draft_version)
        end

        private

        def page_scope_with_includes
          base_page_scope.
            where(language: Language.current).
            preload(
              language: { nodes: [:parent, :page, :children] },
              draft_version: { elements: { contents: { essence: :ingredient_association } } },
            )
        end
      end
    end
  end
end
