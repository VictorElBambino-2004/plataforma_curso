class AddDetailsToCourseModules < ActiveRecord::Migration[8.1]
  def change
    add_column :course_modules, :description, :text
    add_column :course_modules, :video_url, :string
  end
end
