class Backend::DesignsController < Backend::BackendController
  before_action :set_backend_design, only: [:show, :edit, :update, :destroy]

  # GET /backend/designs
  # GET /backend/designs.json
  def index
    @backend_designs = Backend::Design.all
  end

  # GET /backend/designs/1
  # GET /backend/designs/1.json
  def show
  end

  # GET /backend/designs/new
  def new
    @backend_design = Backend::Design.new
  end

  # GET /backend/designs/1/edit
  def edit
  end

  # POST /backend/designs
  # POST /backend/designs.json
  def create
    @backend_design = Backend::Design.new(backend_design_params)

    respond_to do |format|
      if @backend_design.save
        format.html { redirect_to @backend_design, notice: 'Design was successfully created.' }
        format.json { render action: 'show', status: :created, location: @backend_design }
      else
        format.html { render action: 'new' }
        format.json { render json: @backend_design.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/designs/1
  # PATCH/PUT /backend/designs/1.json
  def update
    respond_to do |format|
      if @backend_design.update(backend_design_params)
        format.html { redirect_to @backend_design, notice: 'Design was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @backend_design.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/designs/1
  # DELETE /backend/designs/1.json
  def destroy
    @backend_design.destroy
    respond_to do |format|
      format.html { redirect_to backend_designs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_design
      @backend_design = Backend::Design.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_design_params
      params.require(:backend_design).permit(:name)
    end
end
