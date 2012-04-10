class CourseRequestsController < ApplicationController
  def new
    @course_request = CourseRequest.new
    3.times do
      @course_request.course_request_courses.build
    end
    respond_to do |format|
      format.html
    end
  end

  def create
    @course_request = CourseRequest.new(params[:course_request])
    @course_request.user = current_user

    if @course_request.save
      flash[:notice] = "Request submitted"
      redirect_to course_requests_path + "##{dom_id(@course_request)}"
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render :action => "new"
    end
  end

  def show
    @course_request = CourseRequest.find_by_id_and_user_id(params[:id], current_user.id)
  end

  def index
    @course_requests = CourseRequest.find_all_by_user_id(current_user.id)
  end

  def edit
    @course_request = CourseRequest.find_by_id_and_user_id(params[:id], current_user.id)
  end

  def update
    @course_request = CourseRequest.find_by_id_and_user_id(params[:id], current_user.id)
    
    if @course_request.update_attributes(params[:course_request])
      flash[:notice] = "Request updated"
      redirect_to course_requests_path + "##{dom_id(@course_request)}"
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render :action => "edit"
    end
  end
end
