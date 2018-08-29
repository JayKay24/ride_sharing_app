require 'rails_helper'

RSpec.describe HomeController do
  let(:user) { instance_double(User) }

  describe 'GET #index' do
    it 'returns status ok' do
      get '/'

      expect(response.status).to be(200)
    end
  end
end
