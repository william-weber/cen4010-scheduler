class Course < ActiveRecord::Base
  validates :name, :presence => true
  validates :identifier, :presence => true, :uniqueness => { :case_sensitive => false }
  belongs_to :degree_program

  def self.courses_for(season, year)
    if year.odd? and season == :fall
      pattern = 1
    elsif year.even? and season == :spring
      pattern = 2
    elsif year.even? and season == :fall
      pattern = 3
    elsif year.odd? and season == :spring
      pattern = 4
    end
    Course.find_all_by_offering_pattern(pattern)
  end
end
