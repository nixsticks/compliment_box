class CreateCompliments < ActiveRecord::Migration
  def change
    create_table :compliments do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
