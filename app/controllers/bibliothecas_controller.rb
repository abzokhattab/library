class BibliothecasController < ApplicationController
  include BibliothecasHelper
  before_action :authenticate_user!
  before_action :load_bibliotheca, except: [:index, :create, :new]
  before_action :load_bibliothecas, only: [:index]

  # GET /bibliothecas or /bibliothecas.json
  def index
    @bibliothecas = Bibliotheca.all
  end

  # GET /bibliothecas/1 or /bibliothecas/1.json
  def show
    # @bibliotheca.books=@bibliotheca.books.all
    # byebug
  end

  # GET /bibliothecas/new
  def new
    @bibliotheca = Bibliotheca.new
  end

  # GET /bibliothecas/1/edit
  def edit
  end

  # POST /bibliothecas or /bibliothecas.json
  def create
    @bibliotheca = Bibliotheca.new(bibliotheca_params)

    respond_to do |format|
      if @bibliotheca.save
        format.html { redirect_to bibliotheca_url(@bibliotheca), notice: "Bibliotheca was successfully created." }
        format.json { render :show, status: :created, location: @bibliotheca }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bibliotheca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bibliothecas/1 or /bibliothecas/1.json
  def update
    respond_to do |format|
      if @bibliotheca.update(bibliotheca_params)
        format.html { redirect_to bibliotheca_url(@bibliotheca), notice: "Bibliotheca was successfully updated." }
        format.json { render :show, status: :ok, location: @bibliotheca }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bibliotheca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bibliothecas/1 or /bibliothecas/1.json
  def destroy
    @bibliotheca.destroy

    respond_to do |format|
      format.html { redirect_to bibliothecas_url, notice: "Bibliotheca was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bibliotheca
    @bibliotheca = Bibliotheca.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bibliotheca_params
    params.require(:bibliotheca).permit(:name)
  end

end
