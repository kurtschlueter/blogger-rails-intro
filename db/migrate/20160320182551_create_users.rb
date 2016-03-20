class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.string :image_file_name,    :string
      t.string :image_content_type, :string
      t.string :image_file_size,    :integer
      t.string :image_updated_at,   :datetime

      t.timestamps null: false
    end
  end
end
