require "cenit/collection/mailchimp/version"

module Cenit
  module Collection
    require "cenit/collection/mailchimp/build"
    require "cenit/client"

    # bundle exec irb -I lib -r 'cenit/collection/mailchimp'
    # config = {:push_url => "https://www.cenithub.com/api/v1/push", :connection_token => "My Conn Token", :connection_key => "My Conn Key"}
    # config = {:push_url => "https://www.cenithub.com/api/v1/push", :user_token => "My User Token", :user_key => "My User Key"}
    # Cenit::Collection::Mailchimp.push_collection config
    # Cenit::Collection::Mailchimp.shared_collection

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
      Cenit::Client.push(@mailchimp.sample_data(model).to_json, config)
    end
  end
end