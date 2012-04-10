class CourseRequest < ActiveRecord::Base
  has_many :courses, :through => :course_request_courses
  has_many :course_request_courses
  belongs_to :user

  validates :user, :presence => true
  validates :season, :presence => true
  validates :year, :presence => true
  validates :course_request_courses, :length => { :in => 1..3 }
  validates_uniqueness_of :season, :scope => [ :year, :user_id ]

  accepts_nested_attributes_for :course_request_courses, :reject_if => :all_blank, :allow_destroy => true

  def self.seasons
    [ 'Spring', 'Summer', 'Fall' ]
  end
end
