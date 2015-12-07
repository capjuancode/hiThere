class CheckinsController < ApplicationController
  before_action :set_checkin, only: [:show, :edit, :update, :destroy, :join]
  before_action :authenticate_user!
  # GET /checkins
  # GET /checkins.json
  def index

    @checkins = Checkin.all
    current_user.group_id=nil
    current_user.checkin_id=nil
    current_user.save
  end

  # GET /checkins/1
  # GET /checkins/1.json
  def show
    @users=User.all
    @groups = @checkin.groups.all
  end

  # GET /checkins/new
  def new
    @checkin = current_user.checkins.new
  end

  # GET /checkins/1/edit
  def edit
  end

  # turns user check_id to corrent checkin
  def join
    user=current_user
    user.checkin_id=@checkin.id
    user.save


      respond_to do |format|
        if current_user.checkin_id == @checkin.id
          format.html { redirect_to @checkin, notice: 'You have Join this location.' }
          format.json { render :show, status: :ok, location: @checkin }
        else
          format.html { redirect_to @checkin, notice: 'You could not Join this location.' }
          format.json { render json: @checkin.errors, status: :unprocessable_entity }
        end
      end

  end
  # POST /checkins
  # POST /checkins.json
  def create
    @checkin = current_user.checkins.new(checkin_params)

    respond_to do |format|
      if @checkin.save
        format.html { redirect_to @checkin, notice: 'Checkin was successfully created.' }
        format.json { render :show, status: :created, location: @checkin }
      end
    end
  end

  # PATCH/PUT /checkins/1
  # PATCH/PUT /checkins/1.json
  def update
    respond_to do |format|
      if @checkin.update(checkin_params)
        format.html { redirect_to @checkin, notice: 'Checkin was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkin }
      else
        format.html { render :edit }
        format.json { render json: @checkin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkins/1
  # DELETE /checkins/1.json
  def destroy
    @checkin.destroy
    respond_to do |format|
      format.html { redirect_to checkins_url, notice: 'Checkin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkin
      @checkin = Checkin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkin_params
      params.require(:checkin).permit(:user_id, :location_name, :active)
    end
end
