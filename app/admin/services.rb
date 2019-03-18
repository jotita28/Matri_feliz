ActiveAdmin.register Service do
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
  permit_params :name, :detail, :photo, :address, :region, :todo, :purveyor

  index do
    column :id
    column :name
    column :detail
    column :detail
    column :address
    column :region
    column :todo
    column :purveyor

    actions
  end

  form do |f|
    inputs 'Servicio' do
      input :name
      input :detail
      input :photo
      input :address
      input :region
      input :todo
      input :purveyor
    end
    actions
  end
end
