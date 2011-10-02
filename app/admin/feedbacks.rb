ActiveAdmin.register Feedback do
  scope :default, :scoped, :default => true

  index do
    column :id
    column :campaign
    column :user
    column :true_name
    column :contact_phone
    column :email
    column :useful_rating
    column :content_rating
    column :interact_rating
    column :gain_from_lesson
    column :interesting_feature
    column :advice
    column :created_at
    column :updated_at


    default_actions
  end
end
