class CourseReportsController < ApplicationController
  # GET /reports/1
  # GET /reports/1.json
  def show
    @course_report = CourseReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /reports/new
  # GET /reports/new.json
  def new
    @course_report = CourseReport.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @course_report = CourseReport.new(params[:course_report])
    @course_report.date_run = DateTime.now
    @course_report.user = current_user

    respond_to do |format|
      if @course_report.save
        format.html { redirect_to @course_report, notice: 'Report was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
end
