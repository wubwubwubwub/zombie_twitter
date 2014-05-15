class ZombiesController < ApplicationController
  
  def show
    @zombie = Zombie.find(params[:id])
      respond_to do |format|
      format.xml {render xml: @zombie}
    end
  end
  
  def create
    
  end
  
  def zombie_params
    params.required(:zombie).permit(:name, :graveyard)
  end
  
end
