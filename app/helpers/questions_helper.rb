module QuestionsHelper
  def question_header
    case params['action']
    when 'new'
      "Create New #{@test.title} Question"
    when 'edit'
      "Edit #{Test.find(@question.test_id).title}"
    end
  end

  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

end
