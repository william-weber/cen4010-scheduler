class DayReportsController < ApplicationController
  # GET /reports/1
  # GET /reports/1.json
  def show
    @day_report = DayReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /reports/new
  # GET /reports/new.json
  def new
    @day_report = DayReport.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @day_report = DayReport.new(params[:day_report])
    @day_report.date_run = DateTime.now
    @day_report.user = current_user

    respond_to do |format|
      if @day_report.save
        format.html { redirect_to @day_report, notice: 'Report was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
end
