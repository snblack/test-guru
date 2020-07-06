class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  ACCES_TOKEN = '00713cd65e2587a7de626d8bad941f89c96cd495'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCES_TOKEN}"
      request.headers['Content-type'] = "application/json"
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end

end
