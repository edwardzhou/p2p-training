ActiveAdmin.register Campaign do
  scope :all
  scope :opening, :default => true
  scope :finished
  scope :closed

  index do
    column :id
    column(:status) {|campaign| status_tag(campaign.status)}
    column(:"course.course_name") {|campaign| campaign.course.course_name}
    column :name
    column :trainer
    column :training_room
    column(:price) {|campaign| number_to_currency campaign.price }
    column(:discount_price) {|campaign| number_to_currency campaign.discount_price }
    column :start_date
    column :end_date
    column :register_due_date
    column :description
    column :created_at
    column :updated_at

    default_actions
  end
end
