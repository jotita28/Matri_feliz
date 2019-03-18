ActiveAdmin.register Purveyor do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :email, :password
filter :email

index do
    column :id
    column :name
    column :email
    column :email_provider do |purveyor|
      purveyor.email.split('@').last.capitalize
    end
    column :created_at
    column :phone
    column :member_since do |purveyor|
      time_ago_in_words(purveyor.created_at)
    end
    column :service_own do |purveyor|
        Service.where(purveyor_id: purveyor).count
      end
    actions
  end

  form do |f| 
    inputs 'Proveedor' do 
        input :email
        input :password
    end
    actions
  end

  controller do 
  def update 
    if params[:purveyor][:password].blank? && params[:purveyor][:password_confirmation].blank?
        params[:purveyor].delete('password')
        params[:purveyor].delete('password_confirmation')
    end
    super
  end
  end
end
