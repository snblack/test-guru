module TestsHelper
  def test_header(test)
    if test.new_record?
      t("tests.new.header")
    else
      t("tests.edit.header", test: Test.find(test.id).title)
    end
  end
end
