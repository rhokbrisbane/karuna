ActiveAdmin.register Group do
  menu priority: 1

  permit_params :name, :short_name, :position

  index do
    selectable_column
    id_column
    column :name
    column :short_name
    column :position
    column :created_at
    actions
  end

  filter :name
  filter :short_name
  filter :created_at

  show do |group|
    attributes_table do
      row :id
      row :name
      row :short_name
      row :position
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :short_name, hint: "Enter a short name to be shown in the link to this group"
      f.input :position, hint: "Ordered from low to high numbers", input_html: { min: "1" }
    end
    f.actions
  end
end
