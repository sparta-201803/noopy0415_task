class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :string
      t.text :body

      t.timestamps
    end
  end
end
