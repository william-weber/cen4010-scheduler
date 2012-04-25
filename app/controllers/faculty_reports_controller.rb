class FacultyReportsController < ApplicationController
  # GET /reports/1
  # GET /reports/1.json
  def show
    @faculty_report = FacultyReport.find(params[:id])
    @faculty_requests = FacultyCourseRequest.find_all_by_season_and_year(@faculty_report.season, @faculty_report.year)

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /reports/new
  # GET /reports/new.json
  def new
    @faculty_report = FacultyReport.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @faculty_report = FacultyReport.new(params[:faculty_report])
    @faculty_report.date_run = DateTime.now
    @faculty_report.user = current_user

    respond_to do |format|
      if @faculty_report.save
        format.html { redirect_to @faculty_report, notice: 'Report was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
end
