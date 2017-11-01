class SubsController < ApplicationController
  def create
    @sub = current_user.subs.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def new
    @sub = Sub.new
  end

  def index
    @subs = Sub.all
  end

  def update
    @sub = current_user.subs.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messagesd
      redirect_to edit_sub_url(@sub)
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
