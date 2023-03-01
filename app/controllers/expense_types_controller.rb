class ExpenseTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense_type, only: %i[ show edit update destroy ]
  before_action :check_admin_role

  def index
    @expense_types = ExpenseType.all
  end

  def show
  end

  def new
    @expense_type = ExpenseType.new
  end

  def edit
  end

  def create
    @expense_type = ExpenseType.new(expense_params)

    respond_to do |format|
      if @expense_type.save
        format.html { redirect_to expense_types_url(@expense_type), notice: "Expense type was successfully created." }
        format.json { render :show, status: :created, location: @expense_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @expense_type.update(expense_params)
        format.html { redirect_to expense_types_url(@expense_type), notice: "Expense type was successfully updated." }
        format.json { render :show, status: :ok, location: @expense_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense_type.destroy

    respond_to do |format|
      format.html { redirect_to expense_types_url, notice: "Expense type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_expense_type
    @expense_type = ExpenseType.find(params[:id])
  end

  def check_admin_role
    unless current_user.role == "admin"
      redirect_to root_path
    end
  end

  def expense_params
    params.require(:expense_type).permit(:type_name)
  end
end