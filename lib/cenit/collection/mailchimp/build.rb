require 'cenit/collection/mailchimp/version'
require 'cenit/collection/base/build'

module Cenit
  module Collection
    module Mailchimp
      class Build < Cenit::Collection::Base::Build
        def initialize
          super(__dir__)
        end
      end
    end
  end
end