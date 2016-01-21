ActiveAdmin.register Order do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :user_name, :address, :product_id, :quantity
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
    column :user_name
    column :address
    column :product_id
    column :product
    column :image do |order|
      image_tag order.product.image, width: 60
    end
    column :price do |order|
      order.product.price
    end
    column :quantity
    column :goukei do |order|
      order.product.price * order.quantity
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :user_name
      row :address
      row :product
      row :image do |order|
        image_tag order.product.image, width: 100
      end
      row :price do |order|
        order.product.price
      end
      row :quantity
      row :goukei do |order|
        order.product.price * order.quantity
      end
    end
    active_admin_comments
  end
  # show do
  #   h3 "氏名: #{order.user_name}"
  #   ul do
  #      li{"住所: #{order.address}"}
  #      li{"商品ID: #{order.product_id}"}
  #      li{"商品名: #{order.product.name}"}
  #      li{"商品価格: #{order.product.price}"}
  #      li{"数量: #{order.quantity}"}
  #      li{"合計金額: #{order.product.price * order.quantity}"}
  #   end
  #   active_admin_comments
  # end
end
