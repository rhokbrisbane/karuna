ActiveAdmin.register Group do
  menu priority: 1

  permit_params :name, :position

  index do
    selectable_column
    id_column
    column :name
    column :position
    column :created_at
    actions
  end

  filter :name
  filter :position
  filter :created_at

  show do |group|
    attributes_table do
      row :id
      row :name
      row :position
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :position
    end
    f.actions
  end
end
