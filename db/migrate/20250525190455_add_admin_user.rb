class AddAdminUser < ActiveRecord::Migration[8.0]
  def up
    # Create the admin user
    User.create!(
      email: 'atornow22@gmail.com',
      password: ENV['ADMIN_PASSWORD'],
      password_confirmation: ENV['ADMIN_PASSWORD']
    )
  end

  def down
    # Remove the admin user
    User.find_by(email: 'atornow22@gmail.com')&.destroy
  end
end
