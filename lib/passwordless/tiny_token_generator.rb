# frozen_string_literal: true

module Passwordless
  # Generates random numbers for Session records
  class TinyTokenGenerator
    # Passwordless' tiny token random string strategy. Generates a url safe 6 digit nuimnber
    # @param _session [Session] Optional - Passwordless passes the sesion Record
    # to generators so you can (optionally) use it for generating your tokens.
    # @return [String] 6 digit token
    def call(_session)
      '%06d' % rand(10 ** 6)
    end
  end
end
