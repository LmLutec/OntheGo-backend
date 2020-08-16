class ApplicationController < ActionController::API

    def encode_token(payload)

        secret = 'test1234'

        JWT.encode(payload, secret)

    end 


    def auth_header
        request.headers['Authorization']
    end 

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'test1234', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil 
            end 
        end 
    end

    def current_user
        if decoded_token
            owner_id = decoded_token[0]['owner_id']
            owner = Owner.find_by(id: owner_id)
        end 
    end 

    def logged_in?
        !!current_user
    end 

    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
end
