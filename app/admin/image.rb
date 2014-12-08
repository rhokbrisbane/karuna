ActiveAdmin.register Image do
  menu label: "Meditation images"

  permit_params :title, :postion, :url, :meditation_id

  index do
    selectable_column
    id_column
    column :title
    column('Image') { |meditation| image_tag meditation.url.url(:thumb) }
    column :meditation
    column :position
    actions
  end

  filter :title
  filter :meditation
  filter :created_at

  show do |meditation|
    attributes_table do
      row :id
      row :meditation
      row :title
      row('Image') { image_tag meditation.url.url(:thumb) }
      row :position
      row :created_at
    end
  end

  form :html => {:multipart => true} do |f|
    f.inputs do
      f.input :meditation
      f.input :title
      f.input :position, hint: "Ordered from low to high numbers", input_html: { min: "1" }
      f.input :url, as: :file, label: 'File'
    end
    f.actions
  end
end
