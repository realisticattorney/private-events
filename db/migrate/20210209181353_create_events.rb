class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :description
      t.date :date
      t.references :host, null: false
      
      t.timestamps
    end
  end
end
