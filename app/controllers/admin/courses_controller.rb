class Admin::CoursesController < ApplicationController
  before_filter :only_admin

  def index
    @courses = Course.all
  end

  def edit
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to admin_courses_path, notice: 'Course was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @course = Course.find(params[:id])
    
    if @course.update_attributes(params[:course])
      flash[:notice] = "Course updated"
      redirect_to admin_courses_path
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render :action => "edit"
    end
  end

  protected

  def only_admin
    redirect_to 'home/index' unless (user_signed_in? && current_user.is_admin)
  end
end
