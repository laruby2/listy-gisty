class GistsController < ApplicationController
  def index
    @gists = Gist.all
  end

  def show
    @gist = Gist.find(params[:id])
    response = Net::HTTP.get_response(URI.parse("https://api.github.com/users/#{@gist.name}/gists?per_page=100"))

    @response_body = JSON response.body
    @response_header = response.to_hash
  rescue URI::InvalidURIError => e
    puts e.inspect
    @response_body = e.message
  ensure
  end

  def create
    @gist = Gist.new(gist_params)
    if @gist.save
      redirect_to @gist, notice: "saved"
    else
      redirect_to gists_url, warning: "not saved"
    end
  end

  def destroy
    @gist = Gist.find(params[:id])
    @gist.destroy
    redirect_to @gist
  end

  private

  def gist_params
    params.require(:gist).permit(:name, :url)
  end
end
