class CourseModule < ApplicationRecord
  belongs_to :course
  has_one_attached :video

  before_create :assign_position

  private

  def assign_position
    # Busca la posición más alta actual del curso y le suma 1, o le asigna 1 si es el primero
    max_pos = course.course_modules.maximum(:position) || 0
    self.position = max_pos + 1
  end
end