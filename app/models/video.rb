class Video < ApplicationRecord
  belongs_to :course_module
  validates :title, :url, presence: true
end