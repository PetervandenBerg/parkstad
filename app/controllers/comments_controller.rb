class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :get_message
  before_filter :authenticate_user!
  before_filter :authenticate_admin!, only: [:destroy]
  # GET /comments
  # GET /comments.json
  def index
    @comments = @message.comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @message = Message.find(params[:message_id])
    @comment = @message.comments.find(params[:id])
  end

  # GET /comments/new
  def new
    @message = Message.find(params[:message_id])
    @comment = @message.comments.build
  end

  # GET /comments/1/edit
  def edit
    @message = Message.find(params[:message_id])
    @comment = @message.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @message.comments.build(comment_params)
    @comment.user_name = current_user.name

    respond_to do |format|
      if @comment.save
        format.html { redirect_to message_path(@message), notice: 'Message was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment = @message.comments.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to message_path(@message), notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = @message.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to message_path(@message) }
      format.json { head :no_content }
    end
  end

  private

    def get_message
      @message = Message.find(params[:message_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment, :user_name)
    end
end
