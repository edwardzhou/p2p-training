#encoding: utf-8

ActiveAdmin.register Course do

  index do
    column :id
    column(:avatar) {|course| image_tag(course.avatar_url(:thumb).to_s)}
    column :course_name
    column :status
    column :version
    column :duration_in_hours
    column(:price) {|course| number_to_currency course.price}
    column(:discount_price) {|course| number_to_currency course.discount_price}
    column :display_order
    column :total_register_count
    column :created_at
    column :updated_at
    default_actions
  end

  show do
    panel "课程" do
      attributes_table_for course do
        row :avatar do
          image_tag(course.avatar_url(:thumb).to_s)
        end
        row :course_name
        row :duration_in_hours
        row :price do
          number_to_currency course.price
        end
        row :discount_price do
          number_to_currency course.discount_price
        end
        row :total_interesting_count
        row :total_register_count
        row :status

      end
    end
    panel "课程简介" do
      raw course.short_description
    end
    panel "课程详细" do
      raw course.long_description
    end
  end

  form :partial => "form"

end
