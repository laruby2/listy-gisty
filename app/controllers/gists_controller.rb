class GistsController < ApplicationController
  def index
    @gists = Gist.all
  end

  def show
    @gist = Gist.find(params[:id])
    response = Net::HTTP.get_response(URI.parse("https://api.github.com/users/#{@gist.name}/gists?per_page=100"))
    @response_body = JSON response.body
    @response_header = response.to_hash
  end
end
