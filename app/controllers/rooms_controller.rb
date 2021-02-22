class RoomsController < ApplicationController
  
  def index
    @rooms = Room.where('room_name LIKE ? or address LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    @room.save
    redirect_to rooms_path
  end

  def show
    @room = Room.find(params[:id])
    @booking = Booking.new
  end
  
  def edit
    @room = Room.find(params[:id])    
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:room_name, :room_introduction, :fee, :address, :room_image, :user_id))
      flash[:notice] = "投稿を更新しました"
      redirect_to users_show_path
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to users_show_path
  end

  private
  
    def room_params
      params.require(:room).permit(:room_name, :room_introduction, :fee, :address, :room_image)
    end


end
