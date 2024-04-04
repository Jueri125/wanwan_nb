class Public::RegionsController < ApplicationController
  def index
    @prefectures_by_region = Prefecture.all.group_by(&:region_id)
    @regions = Region.all
  end

  def show
    @prefecture = Prefecture.find_by(id: params[:id])
    @reviews = @prefecture.reviews
  end
end
