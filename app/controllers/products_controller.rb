class ProductsController < ApplicationController
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
  	@product = Product.find(params[:id])
  	render action: 'update'
  end
  def update
  	@product = Product.find(params[:id])
  	if @product.update(parameters)
    	redirect_to '/'
	  else
	    render 'edit'
	  end
  end

  def delete
  end

  private
  def get_product
  	@product = Product.find(parameters)
  end

  private
  def parameters
  	return params.require(:product).permit(:name, :description,:price,:published)
  end
end
