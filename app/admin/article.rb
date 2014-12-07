ActiveAdmin.register Article do
  menu priority: 1

  permit_params :title, :short_title, :group_id, :body, :video_link,
    :audio_link, :position, :featured_image

  index do
    selectable_column
    id_column
    column :title
    column :short_title
    column :group
    column :position
    column :created_at
    column :video_link
    column :audio_link
    actions
  end

  filter :title
  filter :short_title
  filter :group
  filter :created_at

  show do |article|
    attributes_table do
      row :id
      row :group
      row :title
      row :short_title
      row :position
      row('Featured Image') { image_tag article.featured_image.url(:thumb) }
      row(:body) { article.body.html_safe }
      row :video_link
      row :audio_link
      row :created_at
    end
  end

  form :html => {:multipart => true} do |f|
    f.inputs do
      f.input :group
      f.input :title
      f.input :short_title, hint: "Enter a short title to be shown in the link to this article"
      f.input :body, as: :html_editor
      f.input :video_link, hint: "Enter a YouTube link (if applicable)"
      f.input :audio_link, hint: "Enter a Soundcloud link (if applicable)"
      f.input :featured_image, as: :file
      f.input :position, hint: "Ordered from low to high numbers", input_html: { min: "1" }
    end
    f.actions
  end
end
