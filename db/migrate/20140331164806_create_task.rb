class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.column :task, :string
      t.column :done, :boolean

      t.timestamps
    end
  end
end
