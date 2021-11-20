class ParentsStudents < ActiveRecord::Migration
  def up
    create_join_table :parents, :students do |t|
    end
  end

  def down
    drop_join_table :parents, :students
  end
end
