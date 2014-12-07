ActiveAdmin.register Group do
  menu priority: 1

  permit_params :name, :short_name, :position, :featured_image, :description

  index do
    selectable_column
    id_column
    column :name
    column :short_name
    column :description
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
      row('Featured Image') { image_tag group.featured_image.url(:thumb) }
      row :short_name
      row(:description) { group.description.html_safe }
      row :position
      row :created_at
    end
  end

  form :html => {:multipart => true} do |f|
    f.inputs do
      f.input :name
      f.input :short_name, hint: "Enter a short name to be shown in the link to this group"
      f.input :featured_image, as: :file
      f.input :description, as: :html_editor, hint: "Description or introduction for this group"
      f.input :position, hint: "Ordered from low to high numbers", input_html: { min: "1" }
    end
    f.actions
  end
end
