class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def fallback_index_html
        send_file "#{Rails.root}/public/index.html"
    end
end
