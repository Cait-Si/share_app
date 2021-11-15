class RoomsController < ApplicationController
  def top
  end

  def index
    @rooms = Room.all
  end

  def search
    if params[:flag]
      @rooms = Room.where("name LIKE ? OR address LIKE ? OR introduction LIKE ? OR price LIKE ?", "%#{params[:word]}%", "%#{params[:word]}%", "%#{params[:word]}%", "%#{params[:word]}%")
    else
      @rooms = Room.where("address LIKE ?", "%#{params[:word]}%")
    end
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:user_id, :name, :introduction, :price, :address, :image))
    if @room.save
      flash[:notice] = "ルームを新しく登録しました"
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def posts
    @rooms = Room.where(user_id: current_user.id)
  end
end
