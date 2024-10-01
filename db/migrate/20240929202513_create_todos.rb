class CreateTodos < ActiveRecord::Migration[8.0]
  def change
    create_table :todos do |t|
      t.string :description
      t.boolean :complete, default: false
      t.references :todoable, polymorphic: true

      t.timestamps
    end
  end
end
