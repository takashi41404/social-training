class Public::RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def show
    @record = Record.find(params[:id])
    # @comment = Comment.new
  end

  def index
    @records = Record.all
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    @record.user_id = current_user.id
    if @record.save
      redirect_to record_path(@record), notice: "You have created record successfully."
    else
      @records = Record.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @record.update(record_params)
      redirect_to record_path(@record), notice: "You have updated record successfully."
    else
      render "edit"
    end
  end

  def destroy
    @record.destroy
    redirect_to records_path
  end

  private

  def record_params
    params.require(:record).permit(:title, :body, :image)
  end

  def ensure_correct_user
    @record = Record.find(params[:id])
    unless @record.user == current_user
      redirect_to records_path
    end
  end
end
