class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  helper_method :sort_column, :sort_direction

  # GET /employees
  # GET /employees.json
  def index
	if params[:search]
		@employees = Employee.search(params[:search])
	else
		@employees = Employee.all
	end

    @employees = @employees.order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_url, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employees_url, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :age, :role, :active, :sector_id, :skill_ids => [])
    end

	def sort_column
	  Employee.column_names.include?(params[:sort]) ? params[:sort] : "name"
	end

	def sort_direction
	  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
