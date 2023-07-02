class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.all

    if params[:query_text].present?
      @tweets = @tweets.search_full_text(params[:query_text])
    end

    @profile_images = [
      "profile1.png",
      "profile2.png",
      "profile3.png",
      "profile4.png",
      "profile5.png",
      "profile6.png",
      "profile7.png",
      "profile8.png",
      "profile9.png",
      "profile10.png",
      "profile11.png",
      "profile12.png"
    ]

    @tweets = @tweets.paginate(page: params[:page], per_page: 4)
  end

  # GET /tweets/1 or /tweets/1.json
  #def show
    #@profile = Profile.find(params[:id])
 # end
# GET /tweets/1 or /tweets/1.json
def show
  @tweet = Tweet.find(params[:id])
end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
    @image_files = Dir.glob("app/assets/images/profile*.png")
  end

# GET /tweets/1/edit
def edit
  @image_files = Dir.glob("app/assets/images/profile*.png")
end


  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.profile_image.attach(params[:tweet][:profile_image])
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweet_url(@tweet), notice: "Tweet creado correctamente" }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to tweet_url(@tweet), notice: "El Tweet se actualizó correctamente" }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "El Tweet fue eliminado correctamente" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:description, :userName, :profile_image)
    end
end
