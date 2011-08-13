class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.references :user
      t.string :friend_email
      t.string :friend_name
      t.string :my_name
      t.text :content
      t.datetime :last_resend_time
      t.boolean :signed_up

      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
