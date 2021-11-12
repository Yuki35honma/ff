class WareContentsController < ApplicationController

  def new 
    @ware_content = Ware_content.new
    @ware_content.ware_photos.build
  end

  def create
    @ware_content = Ware_content.new(ware_content_params)
    if @ware_content.ware_photos.present?
      @ware_content.save
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  private
    def content_params
      params.require(:ware_content).permit(:title, :content, ware_photos_attributes: [:image]).merge(user_id: current_user.id)
    end

end
