class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :name
      t.string :status
      t.string :host
      t.string :stack
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
