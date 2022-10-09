class BarbeirosController < ApplicationController
  before_action :set_barbeiro, only: %i[ show edit update destroy ]
  before_action :require_login

  def require_login
    unless admin_signed_in? or barbeiro_signed_in?
      redirect_to barbeiros_path
    end
  end

  # GET /barbeiros or /barbeiros.json
  def index
    @barbeiros = Barbeiro.all
  end

  # GET /barbeiros/1 or /barbeiros/1.json
  def show
  end

  # GET /barbeiros/new
  def new
    @barbeiro = Barbeiro.new
  end

  # GET /barbeiros/1/edit
  def edit
  end

  # POST /barbeiros or /barbeiros.json
  def create
    @barbeiro = Barbeiro.new(barbeiro_params)

    respond_to do |format|
      if @barbeiro.save
        format.html { redirect_to barbeiro_url(@barbeiro), notice: "Barbeiro was successfully created." }
        format.json { render :show, status: :created, location: @barbeiro }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @barbeiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barbeiros/1 or /barbeiros/1.json
  def update
    respond_to do |format|
      if @barbeiro.update(barbeiro_params)
        format.html { redirect_to barbeiro_url(@barbeiro), notice: "Barbeiro was successfully updated." }
        format.json { render :show, status: :ok, location: @barbeiro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @barbeiro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barbeiros/1 or /barbeiros/1.json
  def destroy
    @barbeiro.destroy

    respond_to do |format|
      format.html { redirect_to barbeiros_url, notice: "Barbeiro was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barbeiro
      @barbeiro = Barbeiro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def barbeiro_params
      params.require(:barbeiro).permit(:nome, :telefone, :data_nascimento, :email, :password, :password_confirmation)
    end
end
