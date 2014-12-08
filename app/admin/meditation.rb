ActiveAdmin.register Meditation do
  permit_params :name, :description, :media_url, :position

  form do |f|
    f.inputs "Meditation" do
      f.input :name
      f.input :description
      f.input :media_url, hint: "Enter a Soundcloud link (if applicable)"
      f.input :position, hint: "Ordered from low to high numbers", input_html: { min: "1" }
    end
    f.actions
  end

end
