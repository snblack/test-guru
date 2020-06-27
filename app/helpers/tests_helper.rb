module TestsHelper
  def test_header(test)
    if test.new_record?
      "Create New Test"
    else
      "Edit #{Test.find(test.id).title}"
    end
  end
end
