
# Create Admin user
print 'Creating admin user'
AdminUser.create(email: 'admin@example.com', password: "foobar123", password_confirmation: "foobar123")
