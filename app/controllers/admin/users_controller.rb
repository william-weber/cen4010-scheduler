class Admin::UsersController < ApplicationController
  before_filter :only_admin

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.is_admin = params[:user].delete :is_admin
    @user.is_faculty = params[:user].delete :is_faculty
    @user.is_student = params[:user].delete :is_student
    @user.is_secretary = params[:user].delete :is_secretary
    
    if @user.update_attributes(params[:user])
      flash[:notice] = "User updated"
      render :action => "edit"
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render :action => "edit"
    end
  end

  protected

  def only_admin
    #redirect_to 'home/index' unless current_user.is_admin
  end
end
