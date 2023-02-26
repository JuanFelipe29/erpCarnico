class Api::V1::SuppliersController < ApiController
  # before_action :authorized_user!

  def index
    suppliers = Supplier.all
    render json: { data: collection_serialize(suppliers) }, status: :ok
  end

  def show
    render json: { data: serialize(supplier) }, status: :ok
  end

  def create
    supplier = Supplier.create!(supplier_params)
    render json: { data: serialize(supplier) }, status: :created
  end

  def update
    supplier.update!(supplier_params)

    render json: { data: { message: 'Supplier updated' } }, status: :ok
  end

  def destroy
    supplier.destroy!
    render json: { data: { message: 'Supplier deleted' } }, status: :ok
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :nit, :email, :phone)
  end

  def supplier
    @supplier = Supplier.find(params[:id])
  end
end