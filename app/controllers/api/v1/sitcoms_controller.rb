class Api::V1::SitcomsController < ApplicationController
  def show
    @sitcom = Sitcom.find(params[:id])
    render json: Api::V1::SitcomSerializer.new(@sitcom, include:
           [:episodes], params: { user: current_user }).serialized_json
  end
end