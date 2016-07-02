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
    @user_story = @project.user_stories.create(user_story_params)
    redirect_to @project
  end

  def new
    @user_story = UserStory.new
    @user_story.project = @project
    # Set other important default values for display now
  end 

  def destroy
    if @user_story.destroy
      flash[:success] = "User story deleted"
    else
      flash[:error] = "User story could not be deleted"
    end
    redirect_to @project
  end

  def complete
    @user_story.update_attribute(completed_at, Time.now)
    redirect_to @project, notice: "User story completed functionality complete"
  end

  def update
    respond_to do |format|
      if @project.user_stories.update(@project, user_story_params)
        format.html { redirect_to project_path(@project), notice: 'User story was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_story }
      else
        format.html { render :edit }
        format.json { render json: @user_story.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @project = Project.find(params[:project_id])
  end

  def show
  end

 private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_user_story
    @user_story = @project.user_stories(params[:id])
  end

  def user_story_params
    params[:user_story].permit(:param1, :param2, :param3, :row_order_position)
  end
end