# frozen_string_literal: true

Passwordless::Engine.routes.draw do
  get "/session/:token", to: "sessions#show", as: :token_session_start
  post "/session/start", to: "sessions#show", as: :session_start
  match "/sign_out", to: "sessions#destroy", via: %i[get delete], as: :sign_out
end
