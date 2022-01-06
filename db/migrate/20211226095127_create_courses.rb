class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :teacher_name
      t.datetime :date
      t.string :status
      t.text :content
      t.string :photo
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
