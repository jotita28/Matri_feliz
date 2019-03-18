ActiveAdmin.register Booking do
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
  permit_params :name

  index do
    column :id
    column :service
    column :purveyor_id
    column :user
    column :billing
    column :price
    column :created_at
    actions
  end

  form do |f|
    inputs 'Booking' do
      input :service
      input :purveyor_id
      input :user
      input :billing
      input :price
      input :created_at
    end
    actions
  end
end
