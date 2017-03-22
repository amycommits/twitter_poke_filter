class PokemonInfosController < ApplicationController
  before_action :set_pokemon_info, only: [:show, :edit, :update, :destroy]

  # GET /pokemon_infos
  # GET /pokemon_infos.json
  def index
    @pokemon_infos = PokemonInfo.all
  end

  # GET /pokemon_infos/1
  # GET /pokemon_infos/1.json
  def show
  end

  # GET /pokemon_infos/new
  def new
    @pokemon_info = PokemonInfo.new
  end

  # GET /pokemon_infos/1/edit
  def edit
  end

  # POST /pokemon_infos
  # POST /pokemon_infos.json
  def create
    @pokemon_info = PokemonInfo.new(pokemon_info_params)

    respond_to do |format|
      if @pokemon_info.save
        format.html { redirect_to @pokemon_info, notice: 'Pokemon info was successfully created.' }
        format.json { render :show, status: :created, location: @pokemon_info }
      else
        format.html { render :new }
        format.json { render json: @pokemon_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokemon_infos/1
  # PATCH/PUT /pokemon_infos/1.json
  def update
    respond_to do |format|
      if @pokemon_info.update(pokemon_info_params)
        format.html { redirect_to @pokemon_info, notice: 'Pokemon info was successfully updated.' }
        format.json { render :show, status: :ok, location: @pokemon_info }
      else
        format.html { render :edit }
        format.json { render json: @pokemon_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemon_infos/1
  # DELETE /pokemon_infos/1.json
  def destroy
    @pokemon_info.destroy
    respond_to do |format|
      format.html { redirect_to pokemon_infos_url, notice: 'Pokemon info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon_info
      @pokemon_info = PokemonInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pokemon_info_params
      params.require(:pokemon_info).permit(:pokemon_name, :despawns_at, :iv_value, :channel, :coordinates, :latitude, :longitude, :short_url, :long_url, :description)
    end
end
