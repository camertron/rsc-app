class ProgramsController < ApplicationController
  PER_PAGE = 10

  before_action :ensure_login, except: [:new]
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  def index
    @programs = current_user.programs.paginate(
      page: params[:page], per_page: PER_PAGE
    )
  end

  def show
    redirect_to edit_program_path(@program)
  end

  def new
    @program = Program.new
  end

  def create
    @program = current_user.programs.new(program_params)

    if @program.save
      redirect_to @program, notice: 'Program was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @program.update_attributes(program_params)
      redirect_to @program, notice: 'Program was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @program.destroy
    redirect_to new_program_url, notice: 'Program successfully deleted.'
  end

  private

  def program_params
    params.require(:program).permit(:title, :source_code)
  end

  def set_program
    @program = current_user.programs.find(params[:id])
  end
end
