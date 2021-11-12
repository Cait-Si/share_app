class ReserveRoomController < ApplicationController
  def index
    @reserve_rooms = ReserveRoom.where(user_id: current_user.id)
  end

  def confirm
    if params[:reserve_room].nil?
      render reserve_room_confirm_path
    else
      @reserve_room = ReserveRoom.new(params.require(:reserve_room).permit(:room_id, :start_date, :end_date, :people ))
      @room_price = @reserve_room.room.price
      @room_start = @reserve_room.start_date
      @room_end = @reserve_room.end_date
      @room_day = (@reserve_room.end_date - @reserve_room.start_date).to_i
      @room_people = @reserve_room.people
      @room_sum = @reserve_room.room.price * @reserve_room.people * @room_day
    end
  end

  def create
    @reserve_room = ReserveRoom.new(params.require(:reserve_room).permit(:user_id, :room_id, :start_date, :end_date, :people, :sum_price ))
    if @reserve_room.save
      redirect_to reserve_room_show_path
    else
      render reserve_room_confirm_path
    end
  end

  def show
    @reserve_room = ReserveRoom.order("created_at DESC").first
  end
end
