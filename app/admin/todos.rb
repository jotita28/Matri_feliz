ActiveAdmin.register Todo do
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
permit_params :name, :detail, :photo

  index do 
    column :id
    column :name
    column :detail
    column :photo
    
    actions
  end

  form do |f|
    inputs 'Todo' do  
        input :name
        input :detail 
        input :photo
    end
  actions
    end
end
