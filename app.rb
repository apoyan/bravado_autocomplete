require 'sinatra/base'
require_relative 'lib/company_repository'

class App < Sinatra::Base

  set :bind, '0.0.0.0'

  get '/autocomplete' do
    term = params['term']
    content_type :json

    CompanyRepository.search(term).to_json
  end

  run! if app_file == $0
end