class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  

  # GET /orders
  # GET /orders.json
  def index
    
    @orders = Order.all
    redirect_to(root_path) unless current_user.email == "ud@thetraces.com"

    #solution http://stackoverflow.com/questions/6050670/preventing-other-signed-in-users-from-accessing-edit-page

    #unless @Order.user.email == "ud@thetraces.com"
      
    
      #flash[:notice] = "You don't have access to this page"
      #redirect_to root_path
      #redirect_to customers_path(session[:customer_id])
      
    #end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    redirect_to(root_path) unless current_user.email == "ud@thetraces.com"
    #@urldata = request.original_url
    

  end

  # GET /orders/new
  def new
     #@order = current_user.orders.build
     #http://stackoverflow.com/questions/20846970/creation-working-locally-but-not-on-heroku-activerecordunknownattributeerror
     
    
  end

  # GET /orders/1/edit
  def edit
    redirect_to(root_path) unless current_user.email == "ud@thetraces.com"


  end

  # POST /orders
  # POST /orders.json
  def create
     @order = current_user.orders.build(order_params)
   

    respond_to do |format|
      if @order.save

        
      UserMailer.welcome_email.deliver
        

        format.html { redirect_to root_path, notice: 'Order was successfully created. We will get back to you shortly' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

   

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:subject, :content, :urldata)
    end
end
