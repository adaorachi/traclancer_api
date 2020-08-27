if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: "_tracker_app", domain: "frozen-depths-34629.herokuapp.com"

else
  Rails.application.config.session_store :cookie_store, key: "_tracker_app"
end
