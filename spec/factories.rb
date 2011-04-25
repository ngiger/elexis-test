# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end
Factory.sequence :email do |n|
  "person-#{n}@example.com"
end


Factory.define :product_version do |product_version|
  product_version.name = "2.1.35"
  product_version.description = "Dummy description"
  product_version.remarks = "Dummy remark"
  product_version.user_id = 1
end
