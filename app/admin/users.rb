#encoding: utf-8

ActiveAdmin.register User do
  #has_one :user_detail
  #belongs_to :user_detail

  scope :activated, :default => true do |users|
    users.activated.includes [:user_detail]
  end

  filter :id
  filter :username
  filter :email
  filter :true_name
  filter :contact_phone

  index do
    column :id
    column :username
    column :email
    column :true_name
    column :contact_phone
    column :gender do |user|
      t("label.gender.#{user.gender}")
    end
    column :"user_detail.company", :sortable => "user_details.company" do |user|
      user.user_detail.company
    end
    column :"user_detail.title" do |user|
      user.user_detail.title
    end
    #column :"user_detail.company_size" do |user|
    #  t("label.company.size.#{user.user_detail.company_size}")
    #end
    column :"user_detail.address" do |user|
      user.user_detail.address
    end
    column :"user_detail.zip" do |user|
      user.user_detail.zip
    end
    column :"user_detail.id_card" do |user|
      user.user_detail.id_card
    end
    column :"user_detail.birthday" do |user|
      user.user_detail.birthday
    end
    default_actions
  end

  show do
    panel "用户信息" do
      attributes_table_for user do
        row :username
        row :email
        row :true_name
        row :contact_phone
        row :gender
        row :created_at
        row :updated_at
        row :confirmed_at
      end
    end

    panel "详细信息" do
      attributes_table_for user.user_detail do
        row :company
        row :title
        row(:company_size) { t("label.company.size.#{user.user_detail.company_size}") }
        row :address
        row :zip
        row :id_card
        row :birthday
      end
    end
  end



end
