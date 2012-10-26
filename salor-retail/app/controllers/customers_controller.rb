# coding: UTF-8

# Salor -- The innovative Point Of Sales Software for your Retail Store
# Copyright (C) 2012-2013  Red (E) Tools LTD
# 
# See license.txt for the license applying to all files within this software.
# {VOCABULARY} customer_object customer_info customer_sku customer_loyalty_card customer_pagination customer_undefined
# {VOCABULARY} customer_orders customer_order_items customer_points customer_rebates customer_order_items
class CustomersController < ApplicationController
  # {START}
  before_filter :authify, :except => [:labels]
  before_filter :initialize_instance_variables, :except => [:labels]
  before_filter :check_role, :except => [:labels]
  before_filter :crumble, :except => [:labels]
  # GET /customers
  # GET /customers.xml
  def index
    @customers = Customer.scopied.page(GlobalData.params.page).per(GlobalData.conf.pagination)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @customers }
    end
  end

  # GET /customers/new
  # GET /customers/new.xml
  def new
    @customer = Customer.new
    @customer.loyalty_card = LoyaltyCard.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customer }
    end
  end

  def show
    @customer = Customer.scopied.find_by_id(params[:id])
    @item_statistics = @customer.get_item_statistics
    @last_orders = @customer.orders.limit(5).reverse
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
    if not @customer.loyalty_card then
      @customer.loyalty_card = LoyaltyCard.new
    end
    add_breadcrumb I18n.t("menu.customer") + ' ' + @customer.full_name,'edit_customer_path(@customer,:vendor_id => params[:vendor_id])'
  end

  # POST /customers
  # POST /customers.xml
  def create
    
    @customer = Customer.new(params[:customer])
    @loyalty_card = LoyaltyCard.new(params[:loyalty_card])

    respond_to do |format|
      if @loyalty_card.save and @customer.save
        @loyalty_card.update_attribute(:customer_id,@customer.id)
        format.html { redirect_to(:action => 'index', :notice => I18n.t("views.notice.model_create", :model => Customer.model_name.human)) }
        format.xml  { render :xml => @customer, :status => :created, :location => @customer }
      else
        flash[:notice] = I18n.t("system.errors.sku_must_be_unique",:sku => @loyalty_card.sku)
        @customer.loyalty_card = @loyalty_card
        format.html { render :action => "new" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.xml
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        @customer.loyalty_card.update_attributes params[:loyalty_card]
        format.html { redirect_to(:action => 'index', :notice => 'Customer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.xml
  def destroy
    @customer = Customer.find(params[:id])
    @customer.loyalty_card.kill 
    @customer.kill

    respond_to do |format|
      format.html { redirect_to(customers_url) }
      format.xml  { head :ok }
    end
  end

  def labels
    if params[:user_type] == 'User'
      @user = User.find_by_id(params[:user_id])
    else
      @user = Employee.find_by_id(params[:user_id])
    end
    @register = CashRegister.find_by_id(params[:cash_register_id])
    @vendor = @register.vendor if @register
    #`espeak -s 50 -v en "#{ params[:cash_register_id] }"`
    render :nothing => true and return if @register.nil? or @vendor.nil? or @user.nil?

    @customers = Customer.find_all_by_id(params[:id])
    text = Printr.new.sane_template(params[:type],binding)
    if @register.salor_printer
      render :text => text
      #`beep -f 2000 -l 10 -r 3`
    else
      printer_path = params[:type] == 'lc_sticker' ? @register.sticker_printer : @register.thermal_printer
      File.open(printer_path,'w:ISO-8859-15') { |f| f.write text }
      render :nothing => true
    end
  end

  def upload_optimalsoft
    if params[:file]
      lines = params[:file].read.split("\n")
      i, updated_items, created_items, created_categories, created_tax_profiles = FileUpload.new.type4(lines)
      redirect_to(:action => 'index')
    else
      redirect_to :controller => 'items', :action => 'upload'
    end
  end

  private 
  def crumble
    @vendor = salor_user.get_vendor(salor_user.meta.vendor_id)
    add_breadcrumb @vendor.name,'vendor_path(@vendor)'
    add_breadcrumb I18n.t("menu.customers"),'customers_path(:vendor_id => params[:vendor_id])'
  end
  # {END}
end