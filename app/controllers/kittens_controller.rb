class KittensController < ApplicationController
    
  # Display all kittens
  def index
      @kittens = Kitten.all
  end

  # Show a single kitten
  def show
      @kitten = Kitten.find(params[:id])
  end
    
  def new
      @kitten = Kitten.new
  end

  def edit
      @kitten = Kitten.find(params[:id])
  end

  def create
      @kitten = Kitten.new(kitten_params)
      if @kitten.save
         flash[:success] = "You created a kitten. Meow!"
         redirect_to @kitten
      else 
          render 'new'
      end
  end

  def update
  end

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
