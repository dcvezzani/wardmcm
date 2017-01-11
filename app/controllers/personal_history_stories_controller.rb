class PersonalHistoryStoriesController < ApplicationController
  before_action :set_personal_history_story, only: [:show, :edit, :update, :destroy]

  # GET /personal_history_stories
  # GET /personal_history_stories.json
  def index
    @personal_history_stories = PersonalHistoryStory.all
  end

  # GET /personal_history_stories/1
  # GET /personal_history_stories/1.json
  def show
  end

  # GET /personal_history_stories/new
  def new
    @personal_history_story = PersonalHistoryStory.new
  end

  # GET /personal_history_stories/1/edit
  def edit
  end

  # POST /personal_history_stories
  # POST /personal_history_stories.json
  def create
    @personal_history_story = PersonalHistoryStory.new(personal_history_story_params)

    respond_to do |format|
      if @personal_history_story.save
        format.html { redirect_to @personal_history_story, notice: 'Personal history story was successfully created.' }
        format.json { render :show, status: :created, location: @personal_history_story }
      else
        format.html { render :new }
        format.json { render json: @personal_history_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_history_stories/1
  # PATCH/PUT /personal_history_stories/1.json
  def update
    respond_to do |format|
      if @personal_history_story.update(personal_history_story_params)
        format.html { redirect_to @personal_history_story, notice: 'Personal history story was successfully updated.' }
        format.json { render :show, status: :ok, location: @personal_history_story }
      else
        format.html { render :edit }
        format.json { render json: @personal_history_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_history_stories/1
  # DELETE /personal_history_stories/1.json
  def destroy
    @personal_history_story.destroy
    respond_to do |format|
      format.html { redirect_to personal_history_stories_url, notice: 'Personal history story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_history_story
      @personal_history_story = PersonalHistoryStory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_history_story_params
      params.require(:personal_history_story).permit(:subject, :body, :took_place_at)
    end
end
