class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def fallback_index_html
        render file: Rails.root.join('public/index.html')
    end
end
