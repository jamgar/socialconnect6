class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :display_name
      t.text :bio
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
