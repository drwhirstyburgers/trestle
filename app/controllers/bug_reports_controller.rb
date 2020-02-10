class BugReportsController < ApplicationController
  before_action :set_bug_report, only: [:show, :edit, :update, :destroy]
  before_action :is_it_admin

  # GET /bug_reports
  # GET /bug_reports.json
  def index
    @q = BugReport.ransack(params[:q])
    @bug_reports = @q.result.paginate(page: params[:page])
  end

  # GET /bug_reports/1
  # GET /bug_reports/1.json
  def show
  end

  # GET /bug_reports/new
  def new
    @bug_report = BugReport.new
  end

  # GET /bug_reports/1/edit
  def edit
    authorize @bug_report
  end

  # POST /bug_reports
  # POST /bug_reports.json
  def create
    @bug_report = BugReport.new
    @bug_report.priority = params[:bug_report][:priority].to_i
    @bug_report.status = params[:bug_report][:status].to_i
    @bug_report.path = params[:bug_report][:path]
    @bug_report.subject = params[:bug_report][:subject]
    @bug_report.body = params[:bug_report][:body]
    authorize @bug_report

    respond_to do |format|
      if @bug_report.save
        BugReportMailer.new_bug(@bug_report, current_user).deliver
        format.html { redirect_to @bug_report, notice: 'Bug report was successfully created.' }
        format.json { render :show, status: :created, location: @bug_report }
      else
        format.html { render :new }
        format.json { render json: @bug_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bug_reports/1
  # PATCH/PUT /bug_reports/1.json
  def update
    authorize @bug_report
    respond_to do |format|
      if @bug_report.update(bug_report_params)
        format.html { redirect_to @bug_report, notice: 'Bug report was successfully updated.' }
        format.json { render :show, status: :ok, location: @bug_report }
      else
        format.html { render :edit }
        format.json { render json: @bug_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bug_reports/1
  # DELETE /bug_reports/1.json
  def destroy
    authorize @bug_report
    @bug_report.destroy
    respond_to do |format|
      format.html { redirect_to bug_reports_url, notice: 'Bug report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bug_report
      @bug_report = BugReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bug_report_params
      params.require(:bug_report).permit(:priority, :status, :path, :body, :subject)
    end

    def is_it_admin
      if current_user.student? || current_user.guest?
        redirect_to root_path
      end
    end
end
