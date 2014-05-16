class PicturesController < ApplicationController
  def create

    @product = Product.find(params[:product_id])
    @picture = @product.pictures.create!(picture_params)
    redirect_to user_product_path(current_user, @product), :notice => "picture created!"
  end
  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params

      params.require(:picture).permit(:attachment, product_attributes: [:id])
    end
end
