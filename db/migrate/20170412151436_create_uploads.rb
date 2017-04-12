class CreateUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :uploads do |t|
      t.string :title
      t.text :description
      t.string :image
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
