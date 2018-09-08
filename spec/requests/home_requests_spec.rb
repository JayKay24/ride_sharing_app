require 'rails_helper'

RSpec.describe HomeController do
  describe 'index' do
    it "should display 'Car Pooling' in the home page" do
      get '/home'

      expect(response.status).to eq 200
      expect(response.body).to include('Car Pooling')
    end
  end
end
