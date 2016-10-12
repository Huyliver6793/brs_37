class RequestsController < ApplicationController

  def new
    @request = Request.new
  end

  def create
    @request = Request.new request_params
    if @request.save
      flash[:success] = t "request.create_request"
      redirect_to requests_path
    else
      render :new
    end
  end

  def index
    @request = current_user.requests
  end

  private

  def request_params
    params.require(:request).permit(:title, :content, :status)
      .merge user_id: current_user.id
  end
end
