# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TestsUser.delete_all
Report.delete_all
Answer.delete_all
Question.delete_all
Test.delete_all
Category.delete_all
User.delete_all

cat1 = Category.create(title: 'Программирование')
cat2 = Category.create(title: 'Биология')
cat3 = Category.create(title: 'Физика')
cat4 = Category.create(title: 'История')
cat5 = Category.create(title: 'Статистика')

user1 = User.create(first_name: 'Татьяна', last_name: 'Трубчик')
user2 = User.create(first_name: 'Александр', last_name: 'Черняк')

test1 = Test.create(title: 'Ruby Start', level: 1, category_id: cat1.id, user_id: user1.id)
test2 = Test.create(title: 'Ruby Basic', level: 2, category_id: cat2.id, user_id: user1.id)
test3 = Test.create(title: 'Ruby Advanse', level: 3, category_id: cat3.id, user_id: user1.id)
test4 = Test.create(title: 'Великая отечественная война', level: 2, category_id: cat4.id, user_id: user2.id)
test5 = Test.create(title: 'Черные дыры', level: 5, category_id: cat5.id, user_id: user2.id)

question1 = Question.create(body: 'Какой метод выводит текст в консоль?', test_id: test1.id)
question2 = Question.create(body: 'Как создается хэш?', test_id: test1.id)
question3 = Question.create(body: 'Какой код подгружает посевные дынне в базу данных?', test_id: test3.id)
question4 = Question.create(body: 'В каком году началась Великая отечественная война?', test_id: test4.id)
question5 = Question.create(body: 'В каком году впервые была сфотографирована сверхмассивная
чёрная дыра в центре галактики Messier 87?', test_id: test5.id)

Answer.create(body: 'loop', correct: false, question_id: question1.id)
Answer.create(body: 'zoom', correct: false, question_id: question1.id)
Answer.create(body: 'puts', correct: true, question_id: question1.id)

Answer.create(body: 'Hash.new', correct: true, question_id: question2.id)
Answer.create(body: 'h = []', correct: false, question_id: question2.id)
Answer.create(body: 'load', correct: false, question_id: question2.id)

Answer.create(body: 'nails log -gpaph', correct: false, question_id: question3.id)
Answer.create(body: 'rails db:seed', correct: true, question_id: question3.id)
Answer.create(body: 'git commit', correct: false, question_id: question3.id)

Answer.create(body: '1914', correct: false, question_id: question4.id)
Answer.create(body: '1941', correct: true, question_id: question4.id)
Answer.create(body: '1915', correct: false, question_id: question4.id)

Answer.create(body: '2019', correct: true, question_id: question5.id)
Answer.create(body: '1515', correct: false, question_id: question5.id)
Answer.create(body: '2001', correct: false, question_id: question5.id)

TestsUser.create(test_id: test1.id, user_id: user1.id)
TestsUser.create(test_id: test2.id, user_id: user1.id)

TestsUser.create(test_id: test4.id, user_id: user2.id)
TestsUser.create(test_id: test5.id, user_id: user2.id)

# test1.users.push(user1)
# test2.users.push(user2)

# cat1 = Category.create!(title: 'Программирование')
# user1 = User.create!(first_name: 'Татьяна', last_name: 'Трубчик')
# test1 = Test.create!(title: 'Ruby Start', level: 1, category_id: cat1.id, user_id: user1.id)
# question1 = Question.create!(body: 'Как метод выводить текст в консоль?', test_id: test1.id)
# Answer.create!(body: 'loop', correct: false, question_id: question1.id)
# TestsUser.create!(test_id: test1.id, user_id: user1.id)
