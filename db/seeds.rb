(1..10).each do |i|
	no = Digest::SHA1.hexdigest([Time.now, rand].join)[0..5]
	SecretCode.create(code: no)
end
#creating admin
admin_user = User.create(first_name: "Admin", last_name: "User", email: "admin@gmail.com", password: "123456", secret_code_id: 1)
admin_user.add_role :admin