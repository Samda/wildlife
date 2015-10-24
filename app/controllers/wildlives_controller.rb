class WildlivesController < ApplicationController

  def index
  end

  def new
    @wildlife = Wildlife.new
  end

  def create
    @wildlife = Wildlife.create(permitted_params)
    if @wildlife.save
      redirect_to root_path, notice: "Wild has been created !" 
    else
      render :new
    end
  end

  def show
    @wildlife = Wildlife.find(params[:id])
  end

  def edit
    @wildlife = Wildlife.find(params[:id])
  end

  def update
    @wildlife = Wildlife.find(params[:id])
    if @wildlife.update_attributes(permitted_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def permitted_params
    params.require(:wildlife).permit(:name, :description, :lifespan, :mass, :speed, :avatar)
  end
end
