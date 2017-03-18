class CreateKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :keys do |t|
      t.text :code
      t.text :status
      t.text :token

      t.timestamps
    end
  end
end
