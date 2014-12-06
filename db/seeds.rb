
# Create Admin user
print 'Creating admin user'
admin = AdminUser.new(email: 'admin@example.com', password: "foobar123", password_confirmation: "foobar123")
admin.save!
