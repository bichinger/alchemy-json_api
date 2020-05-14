# frozen_string_literal: true
module Alchemy
  module JsonApi
    class BaseController < ::ApplicationController
      include Alchemy::ControllerActions
      include JSONAPI::Fetching
      include JSONAPI::Errors
      include JSONAPI::Filtering
    end
  end
end
