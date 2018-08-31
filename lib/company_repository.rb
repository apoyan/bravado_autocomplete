require 'elasticsearch/persistence'
require_relative 'company'

ELASTIC_HOST = 'elasticsearch'.freeze
ELASTIC_PORT = 9200

class CompanyRepository
  include Elasticsearch::Persistence::Repository

  index_name 'companies'
  document_type 'company'
  client Elasticsearch::Client.new host: "http://#{ELASTIC_HOST}:#{ELASTIC_PORT}", log: true

  def self.search(term)
    return { status: :error, error: 'term can\'t be empty' } if term.nil? || term.empty?
    result = new.search(query: { prefix: { name: term } }).map(&:to_hash)

    { status: :ok, result: result }
  end
end