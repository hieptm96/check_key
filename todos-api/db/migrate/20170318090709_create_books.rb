class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.text :code
      t.text :password

      t.timestamps
    end
  end
end
