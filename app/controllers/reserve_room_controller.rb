class ReserveRoomController < ApplicationController
  def index
    @reserve_rooms = ReserveRoom.where(user_id: current_user.id)
  end

  def confirm
      @reserve_room = ReserveRoom.new(params.permit(:room_id, :start_date, :end_date, :people ))
      @room_price = @reserve_room.room.price
      @room_start = @reserve_room.start_date
      @room_end = @reserve_room.end_date
      @room_day = (@reserve_room.end_date - @reserve_room.start_date).to_i
      @room_people = @reserve_room.people
      @room_sum = @reserve_room.room.price * @reserve_room.people * @room_day
  end

  def create
    @reserve_room = ReserveRoom.new(params.require(:reserve_room).permit(:user_id, :room_id, :start_date, :end_date, :people, :sum_price ))
    if @reserve_room.save
      flash[:notice] = "予約が完了しました"
      redirect_to reserve_room_show_path
    else
      flash[:danger] = @reserve_room.errors.full_messages.join('<br>')
      redirect_to room_path(@reserve_room.room_id)
    end
  end

  def show
    @reserve_room = ReserveRoom.order("created_at DESC").first
  end
end
