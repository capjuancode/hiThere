class CamarasController < ApplicationController
  before_action :set_camara, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :require_permission, only: :edit
  # GET /camaras
  # GET /camaras.json
  def index
    @camaras = Camara.all
      @camara = current_user.camaras.build
  end

  # GET /camaras/1
  # GET /camaras/1.json
  def show
    @review = Review.new
  end

  # GET /camaras/new
  def new
    @camara = current_user.camaras.build
  end

  # GET /camaras/1/edit
  def edit
  end

  # POST /camaras
  # POST /camaras.json
  def create
    @camara = current_user.camaras.build(camara_params)
    @camara.group_id=current_user.group_id
    respond_to do |format|
      if @camara.save
        format.html { redirect_to @camara, notice: 'Camara was successfully created.' }
        format.json { render :show, status: :created, location: @camara }
      else
        format.html { render :new }
        format.json { render json: @camara.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camaras/1
  # PATCH/PUT /camaras/1.json
  def update
      respond_to do |format|
        if @camara.update(camara_params)
          format.html { redirect_to @camara, notice: 'Camara was successfully updated.' }
          format.json { render :show, status: :ok, location: @camara }
        else
          format.html { render :edit }
          format.json { render json: @camara.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /camaras/1
  # DELETE /camaras/1.json
  def destroy
    @camara.destroy
    respond_to do |format|
      format.html { redirect_to camaras_url, notice: 'Camara was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def require_permission
      if current_user != Camara.find(params[:id]).user
        redirect_to root_path
      end

    end

    # Use callbacks to share common setup or constraints between actions.
    def set_camara
      @camara = Camara.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camara_params
      params.require(:camara).permit(:title, :img)
    end
end
