class Course < ActiveRecord::Base
  validates :name, :presence => true
  validates :identifier, :presence => true, :uniqueness => { :case_sensitive => false }
  belongs_to :degree_program

  def full_name
    "#{identifier} #{name}"
  end

  def self.courses_for(array)
    year = array[1]
    season = array[0]
    if year.odd? and season == "fall"
      args = { :offered_odd_fall => true }
    elsif year.even? and season == "spring"
      args = { :offered_even_spring => true }
    elsif year.even? and season == "fall"
      args = { :offered_even_fall => true }
    elsif year.odd? and season == "spring"
      args = { :offered_odd_spring => true }
    end
    Course.where(args)
  end

  def self.semester_for(date)
    if date.month >= 6
      season = :fall
    else
      season = :spring
    end
    [ season, date.year ]
  end
end
