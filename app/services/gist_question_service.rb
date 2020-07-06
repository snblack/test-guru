class GistQuestionService
  ACCES_TOKEN = ENV['GITHUB_TOKEN']

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ACCES_TOKEN)
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.present?
  end

  private

  def gist_params
    {
      "description": I18n.t("gist.params.description", title: @test.title),
      "files": {
        "test-guru-question.txt" => {
          content: gist_content
        }
    }
  }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:doby)
    content.join("\n")
  end


end
