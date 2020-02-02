# Be sure to restart your server when you modify this file.
DinnerDash::Application.config.session_store :redis_store,
                                                servers: ["redis://localhost:6379/0/session"],
                                                expire_after: 90.minutes,
                                                key: "_#{Rails.application.class.parent_name.downcase}_session",
                                                threadsafe: true,
                                                signed: true,
                                                secure: true
Rails.application.config.session_store :cookie_store, key: '_Dinner-Dash_session'
