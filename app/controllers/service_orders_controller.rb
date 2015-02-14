class ServiceOrdersController < ApplicationController
  layout 'service_orders'
  include ServiceOrdersControllerConcern

  before_action :set_service_order, only: [:destroy]
  before_action :set_service_order_for_show_action, only: [:show]

  # GET /service_orders/1
  # GET /service_orders/1.json
  def show
  end

  # GET /service_orders/new
  def new
    @service_order = ServiceOrder.new
    render layout: "application"
  end

  # POST /service_orders
  # POST /service_orders.json
  def create
    @service_order = ServiceOrder.new(service_order_params)

    if @service_order.save
      redirect_to @service_order, notice: 'Service order was successfully created.'
    else
      render :new, layout: "application"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_order
      @service_order = ServiceOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_order_params
      params.require(:service_order).permit(:email, :his_name, :her_name, :his_story, :her_story, :status, :our_relationship, :your_name, :domain, :header_image)
    end

    def set_service_order_for_show_action
      @service_order = ServiceOrder.find service_order_id(request.subdomain)
    end
end
