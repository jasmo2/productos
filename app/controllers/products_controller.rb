class ProductsController < ApplicationController
	before_action :get_product, :only => [:edit, :update, :destroy]



  def read
  	@products = Product.where(published: true)
  	
  	# render inline: "<%=  @products %>"
  	render action: 'read'
  end
  
  def new
  	@product = Product.new
  	render action: 'create'
  end

  def create
  	product = Product.create(parameters)
  	if product.save
  		redirect_to '/'
  	end
  end

  def edit
  	render action: 'update'
  end
  def update
  	if @product.update(parameters)
    	redirect_to '/'
	  else
	    render 'edit'
	  end
  end

  def destroy
    @product.destroy
    redirect_to '/'
  end

  private
  def get_product
	@product = Product.find(params[:id])
  end

  private
  def parameters
  	return params.require(:product).permit(:name, :description,:price,:published)
  end
end
