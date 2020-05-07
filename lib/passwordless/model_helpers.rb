# frozen_string_literal: true

module Passwordless
  # Some helpers for models that can sign in passswordlessly.
  module ModelHelpers
    # Creates relationship - has_many :passwordless_sessions
    # @param field [string] email submitted by user.
    def passwordless
      has_many :passwordless_sessions,
        class_name: "Passwordless::Session",
        as: :authenticatable
    end
  end
end
