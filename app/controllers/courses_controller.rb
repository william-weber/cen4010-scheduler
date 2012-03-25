class CoursesController < ApplicationController
  def index
    @semester = "this semester"
    @semester = "#{params[:semester]} #{params[:year]}" if params[:semester] and params[:year]
    if params[:semester] and params[:year]
      @courses = Course.courses_for([ params[:semester], params[:year].to_i])
    else
      @courses = Course.courses_for( Course.semester_for( Date.today ) )
    end
  end

end
