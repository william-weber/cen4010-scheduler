class TimeReportsController < ApplicationController
  # GET /reports/1
  # GET /reports/1.json
  def show
    @time_report = TimeReport.find(params[:id])
    @courses = @time_report.report_users.map{ |req| req.course }.uniq.sort_by{ |course| course.identifier }

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /reports/new
  # GET /reports/new.json
  def new
    @time_report = TimeReport.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @time_report = TimeReport.new(params[:time_report])
    @time_report.date_run = DateTime.now
    @time_report.user = current_user

    respond_to do |format|
      if @time_report.save
        format.html { redirect_to @time_report, notice: 'Report was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
end
