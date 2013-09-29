class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]
  before_action :get_event
  before_filter :authenticate_user!
  before_filter :authenticate_admin!
  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = @event.attendances
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
    @attendance = @event.attendances.find(params[:id])
  end

  # GET /attendances/new
  def new
    @event = Event.find(params[:event_id])
    @attendance = @event.attendances.build
  end

  # GET /attendances/1/edit
  def edit
    @event = Event.find(params[:event_id])
    @attendance = @event.attendances.find(params[:id])
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = @event.attendances.build(attendance_params)
    @attendance.user_id = current_user.id
    @attendance.user_name = current_user.name

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to event_path(@event), notice: 'Status was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attendance }
      else
        format.html { render action: 'new' }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    @attendance = @event.attendances.find(params[:id])

    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to event_path(@event), notice: 'Status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance = @event.attendances.find(params[:id])
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@event) }
      format.json { head :no_content }
    end
  end

  private

    def get_event
      @event = Event.find(params[:event_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:attending, :msg, :event_id, :user_id, :user_name)
    end
end
