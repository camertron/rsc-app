class AddPrograms < ActiveRecord::Migration[5.2]
  def change
    create_table(:programs) do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.string :source_code, null: false
      t.timestamps
    end
  end
end
