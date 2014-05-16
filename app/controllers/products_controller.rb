class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:edit,:update,:destroy]
  # before_action :set_product_update, only:[:show,:edit,:update]
  # GET /products
  # GET /products.json
  # autocomplete :brand, :name
  def index

    if params[:search]
      @user=current_user
      @search =@user.products.search do
        fulltext params[:search]
      end
      @products = @search.results
    else
      @user=current_user
      @products = @user.products
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show

    @user=current_user
  end

  # GET /products/new
  def new
    @user=User.find(params[:user_id])
    @product=@user.products.new
    # @user = current_user
    # @product = @user.products.build(params[:product])
  end

  # GET /products/1/edit
  def edit
    @user= current_user
  end

  # POST /products
  # POST /products.json
  def create

    @user=User.find(params[:user_id])
    @product = @user.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to  user_products_path(current_user) , notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    debugger
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to user_products_path(current_user), notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|

      format.html { redirect_to user_products_path(current_user) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product

      # @product = Product.find(params[:user_id])
      @product = Product.find(params[:id])
    end
    # def set_product_update

    #   @product = Product.find(params[:id])
    # end
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price,:avatar,:avatar_original_w, :avatar_original_h, :avatar_box_w, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h, :avatar_aspect, user_attributes: [:id])
    end
end
