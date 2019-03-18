ActiveAdmin.register Billing do
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
  permit_params :code, :payment_method, :currency, :amount, :user

  index do
    column :id
    column :code
    column :payment_method
    column :currency
    column :amount
    column :user_id
    column :created_at

    actions
  end

  form do |f|
    inputs 'Billing' do
      input :code
      input :payment_method
      input :currency
      input :amount
      input :user
    end
    actions
  end
end
