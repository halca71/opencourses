class AddCategoryToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :category_name, :string
    add_column :courses, :category_id, :integer
  end
end
