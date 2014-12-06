ActiveAdmin.register Article do
  menu priority: 1

  permit_params :title, :group_id, :body, :position

  index do
    selectable_column
    id_column
    column :title
    column :group
    column :position
    column :created_at
    actions
  end

  filter :title
  filter :body
  filter :group
  filter :position
  filter :created_at

  show do |article|
    attributes_table do
      row :id
      row :group
      row :title
      row :position
      row(:body) { article.body.html_safe }
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :group
      f.input :title
      f.input :body
      f.input :position
    end
    f.actions
  end
end
