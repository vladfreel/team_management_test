ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :first_name, :last_name, :username

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :username
    end
    f.actions
  end
end
