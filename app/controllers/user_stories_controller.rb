class UserStoriesController < ApplicationController

  before_action :set_project
  before_action :set_user_story, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy] 

  def index
    @user_stories = @project.user_stories.rank(:row_order).all
  end

  def update_row_order
    @user_story.row_order_position = user_story_params[:row_order_position]
    @user_story.save

    render nothing:true # this is a POST action, updates sent via AJAX, no view rendered
  end

  def create
    @user_story = @project.user_stories.new(user_story_params)
    if @user_story.save
      flash[:success] = "User story successfully saved"
      redirect_to @project
    else
      render :new
    end
  end

  def new
    @user_story = UserStory.new
  end 

  def destroy
    if @user_story.destroy
      flash[:success] = "User story deleted"
    else
      flash[:error] = "User story could not be deleted"
    end
    redirect_to @project
  end

  def update
    if @project.user_stories.update(@user_story, user_story_params)
      redirect_to project_path(@project), notice: 'User story was successfully updated.' 
    else
      render :edit 
    end
  end


  def edit
    
  end

  def show
  end

 private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_user_story
    @user_story = @project.user_stories.find(params[:id])
  end

  def user_story_params
    params.require(:user_story).permit(:param1, :param2, :param3, :row_order_position)
  end
end