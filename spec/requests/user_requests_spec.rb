require 'rails_helper'

RSpec.describe UsersController do
  describe 'GET #new' do
    it 'returns 200 OK status code' do
      get '/users/new'

      expect(response.status).to eq 200
      expect(response.body).to include('Sign Up')
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'valid user' do
      it 'should register a user into the application' do
        post '/users', params: {
          user: {
            first_name: 'James',
            last_name: 'Njuguna',
            username: 'JayKay',
            email: 'james@example.com',
            password: 'Qwertyuiop123#',
            password_confirmation: 'Qwertyuiop123#'
          }
        }
        expect(response).to redirect_to(action: 'new', controller: 'vehicles')
        follow_redirect!

        expect(response).to render_template(:new)
        expect(response.body).to include('You successfully signed up!')
      end
    end
  end
end
