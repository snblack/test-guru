class GistQuestionService
  # ACCES_TOKEN = ENV['GITHUB_TOKEN']
  ACCES_TOKEN = '00713cd65e2587a7de626d8bad941f89c96cd495'

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ACCES_TOKEN)
  end

  def call
    @client.create_gist(gist_params)
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
