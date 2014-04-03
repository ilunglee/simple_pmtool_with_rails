class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :duedate
      t.integer :view_count

      t.timestamps
    end
    add_index :tasks, [:duedate, :title, :description]
  end
end
