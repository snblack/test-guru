# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Category.create(title: 'Программирование')
# Category.create(title: 'Биология')
# Category.create(title: 'Физика')
# Category.create(title: 'История')
# Category.create(title: 'Статистика')
#
# Test.create(title: 'Ruby Start', level: 1, category_id: 21)
# Test.create(title: 'Ruby Basic', level: 2, category_id: 22)
# Test.create(title: 'Ruby Advanse', level: 3, category_id: 23)
#
# Test.create(title: 'Великая отечественная война', level: 2, category_id: 24)
# Test.create(title: 'Черные дыры', level: 5, category_id: 25)
#
# Question.create(body: 'Как метод выводить текст в консоль?', test_id: 16)
# Question.create(body: 'Как создается хэш?', test_id: 17)
# Question.create(body: 'Какой код подгружает посевные дынне в базу данных?', test_id: 18)
# Question.create(body: 'В каком году началась Великая отечественная война?', test_id: 19)
# Question.create(body: 'В каком году впервые была сфотографирована сверхмассивная
# чёрная дыра в центре галактики Messier 87?', test_id: 20)
#
# Answer.create(body: 'loop', correct: false, question_id:16)
# Answer.create(body: 'zoom', correct: false, question_id:16)
# Answer.create(body: 'puts', correct: true, question_id:16)
#
# Answer.create(body: 'Hash.new', correct: true, question_id:17)
# Answer.create(body: 'h = []', correct: false, question_id:17)
# Answer.create(body: 'load', correct: false, question_id:17)
#
# Answer.create(body: 'nails log -gpaph', correct: false, question_id:18)
# Answer.create(body: 'rails db:seed', correct: true, question_id:18)
# Answer.create(body: 'git commit', correct: false, question_id:18)
#
# Answer.create(body: '1914', correct: false, question_id:19)
# Answer.create(body: '1941', correct: true, question_id:19)
# Answer.create(body: '1915', correct: false, question_id:19)
#
# Answer.create(body: '2019', correct: true, question_id:20)
# Answer.create(body: '1515', correct: false, question_id:20)
# Answer.create(body: '2001', correct: false, question_id:20)


# User.create(first_name: 'Татьяна', last_name: 'Трубчик')
# User.create(first_name: 'Александр', last_name: 'Черняк')

Report.create(test_id: 16, user_id: 1, status: 'Прошел')
Report.create(test_id: 17, user_id: 1, status: 'В процессе')

Report.create(test_id: 19, user_id: 2, status: 'Прошел')
Report.create(test_id: 20, user_id: 2, status: 'В процессе')
