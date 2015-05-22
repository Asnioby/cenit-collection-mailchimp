module Cenit
  module Collection
    require File.expand_path(File.join(*%w[ mailchimp build ]), File.dirname(__FILE__))
    require "cenit/client"

    @mailchimp = Cenit::Collection::Mailchimp::Build.new

    # Include Collection Gem dependency
    # require "cenit/collection/[My Dependency Collection]/build"
    # Collection dependency
    # @mailchimp.register_dep(Cenit::Collection::[My Dependency Collection]::Build.new)

    def self.push_collection (config)
      Cenit::Client.push(@mailchimp.shared_collection.to_json, config)
    end

    def self.show_collection
      @mailchimp.shared_collection
    end

    def self.pull_collection (parameters,config)
      @mailchimp.shared_collection
    end

    def self.push_sample(model, config)
      Cenit::Client.push(@mailchimp.sample_model(model).to_json, config)
    end

    def self.import(data)
      @mailchimp.import_data(data)
    end
  end
end