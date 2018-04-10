family = Family.create!(name: 'Cosby Family')
admin = User.new(
  first_name: 'Bill',
  last_name: 'Cosby',
  email: 'admin@example.com', 
  password: '123456789'
)
admin.skip_confirmation!
admin.save
admin.add_role(:admin, family)

user = User.new(
  first_name: 'Erin',
  last_name: 'Cosby',
  email: 'user@example.com', 
  password: '123456789'
)
user.skip_confirmation!
user.save
user.add_role(:user, family)

task = family.tasks.create!(
  author: admin,
  description: 'Clean room',
  tag_list: 'clean, room, wash',
  state: :opened
)
first_comment = task.comments.create!(
  task: task,
  author: user,
  body: 'Maybe next week?'
)
first_comment_reply = first_comment.comments.create!(
  task: task,
  author: admin,
  body: 'No, it will be on this week!'
)

%w[house outdoor].each do |category_name|
  category = Category.create!(name: category_name)
  %w[food trip room].each do |subcategory_name|
    subcategory = category.children.create!(name: subcategory_name)
    %w[clean remove fix].each do |sub_subcategory_name|
      subcategory.children.create!(name: sub_subcategory_name)
    end
  end
end
