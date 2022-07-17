class CreateSocialComments < ActiveRecord::Migration[6.1]
  def change
    create_table :social_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :record_id

      t.timestamps
    end
  end
end
