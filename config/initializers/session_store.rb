if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: "_tracker_app", domain: "stormy-oasis-69756.herokuapp.com"

else
  Rails.application.config.session_store :cookie_store, key: "_tracker_app"
end
