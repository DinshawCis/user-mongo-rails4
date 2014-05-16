class CommentsController < ApplicationController
  def create

    @user= User.find(params[:user_id])
    @product = @user.products.find(params[:product_id])
    @comment = @product.comments.create!(comment_params)
    redirect_to user_product_path(current_user, @product), :notice => "comment created!"
  end
  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params

      params.require(:comment).permit(:name,:content, product_attributes: [:id])
    end
end
