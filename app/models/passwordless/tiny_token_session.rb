# frozen_string_literal: true

module Passwordless
  # The session responsible for holding the connection between the record
  # trying to log in and the unique tokens.
  class TinyTokenSession < Session

    def set_defaults
      self.expires_at ||= Passwordless.expires_at.call
      self.timeout_at ||= Passwordless.tiny_token_timeout_at.call
      self.token ||= loop {
        token = Passwordless.tiny_token_generator.call(self)
        break token unless Session.find_by(token: token)
      }
    end
  end
end
