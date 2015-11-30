class GroupingTablesController < ApplicationController

  before_filter :load_group
  before_filter :set_checkin

  def new
    @grouping_table = @group.grouping_table.new
    @grouping_table.user_id=current_user.id
    @grouping_table.checkin_id=@checkin.id
  end

  def create
    @grouping_table = @group.grouping_table.new(grouping_table_params)
    respond_to do |format|
      if @grouping_table.save
        format.html { redirect_to checkin_group_path(@checkin, @group), notice: 'You have successfully Join this Group.'}
        format.json { render :show, status: :created, location: @grouping_table }
      else
        format.html { render :new }
        format.json { render json: @grouping_table.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def load_group
    @group = Group.find(params[:group_id])
  end

   def set_checkin
     @checkin = Checkin.find(params[:checkin_id])
   end

   def grouping_table_params
     params.require(:grouping_table).permit( :user_id, :group_id, :checkin_id)
   end

end
