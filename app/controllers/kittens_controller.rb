class KittensController < ApplicationController
    
  # Display all kittens
  def index
      @kittens = Kitten.all
      respond_to do |format|
          format.html
          format.json { render :json => @kittens }
      end
  end

  # Show a single kitten
  def show
      @kitten = Kitten.find(params[:id])
      respond_to do |format|
          format.html
          format.json { render :json => @kitten }
      end
  end
    
  # Initialize new kitten
  def new
      @kitten = Kitten.new
  end

  # Find kitten to edit
  def edit
      @kitten = Kitten.find(params[:id])
  end

  # Create kitten with given params
  def create
      @kitten = Kitten.new(kitten_params)
      if @kitten.save
         flash[:success] = "You created a kitten. Meow!"
         redirect_to @kitten
      else 
          render 'new'
      end
  end

  # Update edited kitten with params
  def update
      @kitten = Kitten.find(params[:id])
      if @kitten.update_attributes(kitten_params)
          flash[:success] = "You've updated your kitten!"
          redirect_to @kitten
      else
          render 'edit'
      end
  end

  # Destroy kitten
  def destroy
      Kitten.find(params[:id]).destroy
      flash[:notice] = "Kitten deleted. hiss!"
      redirect_to root_url
  end
    
    private
    
  def kitten_params
     params.require(:kitten).permit(:name, :age, :cuteness, :softness) 
  end
end
