class Admin::PrefecturesController < ApplicationController
  def index
    @prefectures = Prefecture.where(region_id: params[:region_id])
  end
  
  def show
    @prefecture = Prefecture.find(params[:id])
    @reviews = @prefecture.reviews
  end

end
