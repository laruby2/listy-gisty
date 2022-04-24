class CreateGists < ActiveRecord::Migration[4.2]
  def change
    create_table :gists do |t|
      t.string :name
      t.string :url
      t.text :description

      t.timestamps null: false
    end
  end
end
