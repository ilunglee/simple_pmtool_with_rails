class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.datetime :duedate
      t.integer :view_count

      t.timestamps
    end
    add_index :projects, [ :duedate,:title, :description ]
  end
end
