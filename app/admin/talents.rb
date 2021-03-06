ActiveAdmin.register Talent do

  permit_params :f_name, :l_name, :e_f_name, :e_l_name, :sex, :dob, :blood, :height, :weight, :chest, :waist_bust, :hips, :shoes, :birthplace, :role, :body, images_attributes: [:_destroy,:id,:url]
  

  
  form do |f|
    f.inputs do
      f.has_many :images do |t|
        t.input :url
      end
      f.input    :f_name
      f.input    :l_name
      f.input    :e_f_name
      f.input    :e_l_name
      f.input    :sex, as: :select, collection: ['男性', '女性', 'その他'], prompt: "選択してください"
      f.input    :dob, as: :date_picker
      f.input    :blood, as: :select, collection: ['A型', 'B型', 'O型', 'AB型'], prompt: "選択してください"
      f.input    :height
      f.input    :weight
      f.input    :chest_bust
      f.input    :waist
      f.input    :hips
      f.input    :shoes
      f.input    :birthplace
      f.input    :role
      f.input    :body
    end
    f.actions
  end
  show do |talent|
    attributes_table(*talent.class.columns.collect { |column| column.name.to_sym })
    panel "写真一覧" do
      table_for talent.images do
        column :url
      end
    end
    active_admin_comments
  end

end
