class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    @message = Message.new
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @comments = @message.comments(@message)
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
    @message = current_user.messages.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.user_name = current_user.name
    @message.user_id = current_user.id

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: 'Message was successfully created.' }
        format.json { render action: 'show', status: :created, location: @message }
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to messages_path, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:msg, :user_name, :user_id)
    end
end
