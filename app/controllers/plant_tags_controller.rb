class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @tags = Tag.where(id: params[:plant_tag][:tag])
    @tags.each do |tag|
      plant_tag = PlantTag.new(plant: @plant, tag: tag)
      plant_tag.save
    end
    redirect_to garden_path(@plant.garden)
  end

  # TO DEAL WITH THE ERROR MESSAGES WHEN SELECTING MULTIPLE OF THE SAME TAGS - CAN BE REFACTORED
  # def create
  #   @plant = Plant.find(params[:plant_id])
  #   @tags = Tag.where(id: params[:plant_tag][:tag])
  #   saved = []
  #   @tags.each do |tag|
  #     plant_tag = PlantTag.new
  #     plant_tag.plant = @plant
  #     plant_tag.tag = tag
  #     plant_tag.save
  #     saved << plant_tag.save
  #   end
  #   if saved.all? {|item| item }
  #     redirect_to garden_path(@plant.garden)
  #   else
  #     @plant_tag = PlantTag.new
  #     render :new, notice: 'dammit'
  #   end
  # end

end
