class Admin::FieldsController < AdminController

  def index
    @fields = Field.all(:order => :name)
  end

  def new
    @field = Field.new
  end

  def create
    @field = Field.new(params[:field])

    if @field.save
      flash[:notice] = "Field was successfully updated"
      redirect_to admin_fields_url
    else
      render "edit"
    end
  end

  def edit
    @field = Field.find(params[:id])
  end

  def destroy
    Field.find(params[:id]).destroy
    redirect_to admin_fields_url
  end

  def update
    @field = Field.find(params[:id])

    if @field.update_attributes(params[:field])
      flash[:notice] = "Field was successfully updated"

      redirect_to admin_fields_url
    else
      render "edit"
    end
  end

end
