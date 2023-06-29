# frozen_string_literal: true
require_relative "gravatar_helper/version"
require "gravatar_helper"
require 'active_support'
require 'active_support/concern'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/class/attribute'
require 'action_view/helpers'


module GravatarHelper
  class Error < StandardError; end

  class Generator
    def self.generate(user, options = { size: 80 })
      email_address = user.email.downcase
      hash = Digest::MD5.hexdigest(email_address)
      size = options[:size]
      gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
      view = DummyView.new
      view.image_tag(gravatar_url, alt: user.username, class: "rounded mx-auto d-block shadow")
    end

    class DummyView
      include ActionView::Helpers::AssetTagHelper
    end
  end
end


