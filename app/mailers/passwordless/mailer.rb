# frozen_string_literal: true

module Passwordless
  # The mailer responsible for sending Passwordless' mails.
  class Mailer < Passwordless.parent_mailer.constantize
    default from: Passwordless.default_from_address

    # Sends a magic link (secret token) email.
    # @param session [Session] A Passwordless Session
    def magic_link(session)
      @session = session

      @magic_link =
        send(Passwordless.mounted_as)
          .token_session_start_url(session.token)

      email =
        @session
          .authenticatable
          .email

      mail(
        to: email,
        subject: I18n.t("passwordless.mailer.subject"),
      )
    end
  end
end
