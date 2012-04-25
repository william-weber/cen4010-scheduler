class FacultyCourseRequestsController < ApplicationController
  def index
    @faculty_course_requests = FacultyCourseRequest.find_all_by_user_id(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @faculty_course_request = FacultyCourseRequest.new
    3.times do
      @faculty_course_request.course_request_courses.build
    end

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @faculty_course_request = FacultyCourseRequest.find_by_id_and_user_id(params[:id], current_user.id)
    (3 - @faculty_course_request.course_request_courses.count).times do
      @faculty_course_request.course_request_courses.build
    end
  end

  def create
    @faculty_course_request = FacultyCourseRequest.new(params[:faculty_course_request])
    @faculty_course_request.user = current_user

    respond_to do |format|
      if @faculty_course_request.save
        flash[:notice] = "Request submitted"
        redirect_to faculty_course_requests_path + "##{dom_id(@faculty_course_request)}"
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @faculty_course_request = FacultyCourseRequest.find_by_id_and_user_id(params[:id], current_user.id)

    respond_to do |format|
      if @faculty_course_request.update_attributes(params[:faculty_course_request])
        flash[:notice] = "Request updated"
        redirect_to faculty_course_requests_path + "##{dom_id(@faculty_course_request)}"
      else
        render :action => "edit"
      end
    end
  end

  def destroy
    @faculty_course_request = FacultyCourseRequest.find_by_id_and_user_id(params[:id], current_user.id)
    @faculty_course_request.destroy

    respond_to do |format|
      format.html { redirect_to faculty_course_requests_url }
    end
  end
end
