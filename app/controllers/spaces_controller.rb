class SpacesController < ApplicationController

	def index
    @spaces = Space.all
    @hash = Gmaps4rails.build_markers(@spaces) do |space, marker|
    marker.lat space.latitude
    marker.lng space.longitude
    marker.infowindow space.name
    marker.picture({
    "width" => 32,
    "height" => 32})
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @space = Space.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @space = Space.new(space_params)

    respond_to do |format|
      if @space.save
        format.html { redirect_to @space, notice: 'Space was successfully created.' }
        format.json { render :show, status: :created, location: @space }
      else
        format.html { render :new }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @space.update(space_params)
        format.html { redirect_to @space, notice: 'Space was successfully updated.' }
        format.json { render :show, status: :ok, location: @space }
      else
        format.html { render :edit }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @space.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Space was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @space = Space.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:space).permit(:latitude, :longitude, :address, :description, :name, :role)
    end
end
