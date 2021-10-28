class Api::V1::RatesController < ApplicationController
  # skip_before_action :verify_authenticity_token
 
  def index
   @rates = Rate.where(rateable_id: params[:id],
     rateable_type: params[:type].capitalize!)
   render json: Api::V1::Rateserializer.new(@rates, include:
     [:user]).serialized_json
  end
 
  def create
   @rate = Rate.new(rate_params.merge(user: current_user))
   if @rate.save
    render json: @rate
   else
    render json: { errors: @rate.errors.full_messages }, status:
    :unprocessable_entity
   end
  end
 
  private
 
   def rate_params
     params.require(:rate).permit(:rateable_type, :rateable_id,
     :rating, :description)
   end
 end