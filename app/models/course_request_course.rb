class CourseRequestCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :course_request
  validates :course, :presence => true
  validates :time, :presence => true
  validates :rank, :presence => true

  default_scope :order => 'rank ASC'

  def self.times
    [ 'Morning', 'Afternoon', 'Evening' ]
  end
end
