class ReportsController < ApplicationController
  # GET /reports
  def index
    @reports = Report.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # DELETE /reports/1
  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url }
    end
  end
end
