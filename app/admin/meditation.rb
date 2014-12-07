ActiveAdmin.register Meditation do
  permit_params :name, :description, :media_url

  form do |f|
    f.inputs "Meditation" do
      f.input :name
      f.input :description
      f.input :media_url
      f.input :name
    end
    f.actions
  end

end
