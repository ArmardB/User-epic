class UserStoriesController < ApplicationController
  before_action :set_project
  before_action :set_user_story, except: [:create]

  def create
    @user_story = @project.user_stories.create(user_story_params)
    redirect_to @project
  end
  
  def destroy
    if @user_story.destroy
      flash[:success] = "User story deleted"
    else
      flash[:error] = "User story could not be deletd"
    end
    redirect_to @project
  end
  
  # def complete
  #   user_story.update_attribute(completed_at, Time.now)
  #   redirect_to @project, notice: "User story completed functionality complete"
  # end
  
  def update
    respond_to do |format|
      if @user_story.update(user_story_params)
        format.html { redirect_to @user_story, notice: 'User story was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_story }
      else
        format.html { render :edit }
        format.json { render json: @user_story.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
  end
  
  def move
    @user_story.move_to! params[:position]
  end

  private
  
  def set_project
    @project = Project.find(params[:project_id])
  end
  
  def set_user_story
    @user_story = @project.user_stories.find(params[:id])
  end
  
  def user_story_params
    params[:user_story].permit(:param1, :param2, :param3)
  end
  
end
  
  
  
  
  
  
  
  
#   # GET /user_stories
#   # GET /user_stories.json
#   def index
#     @user_stories = UserStory.all
#   end

#   # GET /user_stories/1
#   # GET /user_stories/1.json
#   def show
#   end

#   # GET /user_stories/new
#   def new
#     @user_story = UserStory.new
#   end

#   # GET /user_stories/1/edit
#   def edit
#   end

#   # POST /user_stories
#   # POST /user_stories.json
#   def create
#     @user_story = UserStory.new(user_story_params)

#     respond_to do |format|
#       if @user_story.save
#         format.html { redirect_to @user_story, notice: 'User story was successfully created.' }
#         format.json { render :show, status: :created, location: @user_story }
#       else
#         format.html { render :new }
#         format.json { render json: @user_story.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /user_stories/1
#   # PATCH/PUT /user_stories/1.json
#   def update
#     respond_to do |format|
#       if @user_story.update(user_story_params)
#         format.html { redirect_to @user_story, notice: 'User story was successfully updated.' }
#         format.json { render :show, status: :ok, location: @user_story }
#       else
#         format.html { render :edit }
#         format.json { render json: @user_story.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /user_stories/1
#   # DELETE /user_stories/1.json
#   def destroy
#     @user_story.destroy
#     respond_to do |format|
#       format.html { redirect_to user_stories_url, notice: 'User story was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_user_story
#       @user_story = UserStory.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def user_story_params
#       params.require(:user_story).permit(:param1, :param2, :param3, :references)
#     end
# end
