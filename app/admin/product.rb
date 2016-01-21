ActiveAdmin.register Product do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :description, :price, :image # :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  index do
    selectable_column
    column :id
    column :name
    column :description
    column :price
    column :image do |product|
      image_tag product.image, width: 100
    end
    actions
  end
  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :price
      row :image do |product|
        image_tag product.image, width: 100
      end
    end
    active_admin_comments
  end
end
