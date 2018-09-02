require_relative '../../helpers/request_helpers.rb'

RSpec.shared_examples 'redirection to sign in example' do |request_values|
  it 'expects to be redirected to the sign in form' do
    if !request_values[:method_params].empty?
      if request_values[:http_method] == 'get'
        get request_values[:initial_path], request_values[:method_params]
      elsif request_values[:http_method] == 'post'
        post request_values[:initial_path], request_values[:method_params]
      elsif request_values[:http_method] == 'put'
        put request_values[:initial_path], request_values[:method_params]
      end
    else
      if request_values[:http_method] == 'get'
        get request_values[:initial_path]
      else
        delete request_values[:initial_path]
      end
    end
    expect_redirection_to(
      request_values[:expected_path], request_values[:content]
    )
  end
end
