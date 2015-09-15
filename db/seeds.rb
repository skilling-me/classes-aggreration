puts "Seeds: start"

Resource.create!(
  title: "Try Ruby",
  description: "Got 15 minutes? Learn the basic building blocks of the Ruby programming language, all in the browser.",
  url: "http://tryruby.org"
)

Resource.create!(
  title: "Codewars",
  description: "Improve your skills by training with others on real code challenges",
  url: "http://www.codewars.com/"
)

Resource.create!(
  title: "freeCodeCamp",
  description: "Learn to code by helping nonprofits. Build your full stack web development portfolio today.",
  url: "http://freecodecamp.com/"
)

Category.create!(
  title: "JavaScript",
  slug: "js"
)

Category.create!(
  title: "Ruby",
  slug: "ruby"
)

Category.create!(
  title: "Web development",
  slug: "web-dev"
)

Categorisation.create!(
  resource: Resource.find(1),
  category: Category.find(2)
)

Categorisation.create!(
  resource: Resource.find(2),
  category: Category.find(1)
)
Categorisation.create!(
  resource: Resource.find(2),
  category: Category.find(2)
)
Categorisation.create!(
  resource: Resource.find(3),
  category: Category.find(1)
)

puts "============Adding tags============="
@resource = Resource.find(1)
@resource.cost_list.add('free')
@resource.type_list.add('interactive tutorial')
@resource.level_list.add('for dummies')
@resource.save

@resource = Resource.find(2)
@resource.cost_list.add('free')
@resource.type_list.add('quizes')
@resource.level_list.add('for dummies', 'intermediate', 'advanced')
@resource.save

@resource = Resource.find(3)
@resource.cost_list.add('free')
@resource.type_list.add('bootcamp')
@resource.level_list.add('for dummies', 'intrmediate')
@resource.save


puts "============Adding users============="
User.create!(
  email: 'admin@admin.com',
  password: 'adminadmin',
  first_name: 'Root',
  admin: true
  )
User.create!(
  email: 'user@example.com',
  password: 'useruser',
  first_name: 'User',
  last_name: 'Superuser'
  )

puts "Seeds: done"
