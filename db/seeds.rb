
admin = User.new(
  first_name: 'Bill',
  last_name: 'Cosby',
  email: 'admin@example.com', 
  password: '123456789', 
  password_confirmation: '123456789'
)
admin.skip_confirmation!
admin.save!

family = Family.create(name: 'Cosby Family')
admin.add_role(:admin, family)


user = User.new(
  first_name: 'Erin',
  last_name: 'Cosby',
  email: 'user@example.com', 
  password: '123456789', 
  password_confirmation: '123456789'
)
user.skip_confirmation!
user.save!

user.add_role(:user, family)
