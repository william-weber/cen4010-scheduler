class StudentReportsController < ApplicationController
  # GET /reports/1
  # GET /reports/1.json
  def show
    @student_report = StudentReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /reports/new
  # GET /reports/new.json
  def new
    @student_report = StudentReport.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @student_report = StudentReport.new(params[:student_report])
    @student_report.date_run = DateTime.now
    @student_report.user = current_user

    respond_to do |format|
      if @student_report.save
        format.html { redirect_to @student_report, notice: 'Report was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
end
