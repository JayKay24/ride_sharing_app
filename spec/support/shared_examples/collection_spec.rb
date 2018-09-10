require_relative '../../helpers/request_helpers.rb'

RSpec.shared_examples 'redirection to sign in example' do |request_values|
  it 'expects to be redirected to the sign in form' do
    http_method = request_values[:http_method]
    method_params = request_values[:method_params]
    initial_path = request_values[:initial_path]

    if method_params.empty?
      send(http_method, initial_path)
    else
      send(http_method, initial_path, method_params)
    end
    expect_redirection_to(
      request_values[:expected_path], request_values[:content]
    )
  end
end
