class ApiController < ActionController::API
    def index
        render json: { 'status' => 'online' }
    end
end
