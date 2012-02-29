# coding: UTF-8
# ------------------- Salor Point of Sale ----------------------- 
# An innovative multi-user, multi-store application for managing
# small to medium sized retail stores.
# Copyright (C) 2011-2012  Jason Martin <jason@jolierouge.net>
# Visit us on the web at http://salorpos.com
# 
# This program is commercial software (All provided plugins, source code, 
# compiled bytecode and configuration files, hereby referred to as the software). 
# You may not in any way modify the software, nor use any part of it in a 
# derivative work.
# 
# You are hereby granted the permission to use this software only on the system 
# (the particular hardware configuration including monitor, server, and all hardware 
# peripherals, hereby referred to as the system) which it was installed upon by a duly 
# appointed representative of Salor, or on the system whose ownership was lawfully 
# transferred to you by a legal owner (a person, company, or legal entity who is licensed 
# to own this system and software as per this license). 
#
# You are hereby granted the permission to interface with this software and
# interact with the user data (Contents of the Database) contained in this software.
#
# You are hereby granted permission to export the user data contained in this software,
# and use that data any way that you see fit.
#
# You are hereby granted the right to resell this software only when all of these conditions are met:
#   1. You have not modified the source code, or compiled code in any way, nor induced, encouraged, 
#      or compensated a third party to modify the source code, or compiled code.
#   2. You have purchased this system from a legal owner.
#   3. You are selling the hardware system and peripherals along with the software. They may not be sold
#      separately under any circumstances.
#   4. You have not copied the software, and maintain no sourcecode backups or copies.
#   5. You did not install, or induce, encourage, or compensate a third party not permitted to install 
#      this software on the device being sold.
#   6. You have obtained written permission from Salor to transfer ownership of the software and system.
#
# YOU MAY NOT, UNDER ANY CIRCUMSTANCES
#   1. Transmit any part of the software via any telecommunications medium to another system.
#   2. Transmit any part of the software via a hardware peripheral, such as, but not limited to,
#      USB Pendrive, or external storage medium, Bluetooth, or SSD device.
#   3. Provide the software, in whole, or in part, to any thrid party unless you are exercising your
#      rights to resell a lawfully purchased system as detailed above.
#
# All other rights are reserved, and may be granted only with direct written permission from Salor. By using
# this software, you agree to adhere to the rights, terms, and stipulations as detailed above in this license, 
# and you further agree to seek to clarify any right not directly spelled out herein. Any right, not directly 
# covered by this license is assumed to be reserved by Salor, and you agree to contact an official Salor repre-
# sentative to clarify any rights that you infer from this license or believe you will need for the proper 
# functioning of your business.
require 'rubygems'
require 'mechanize'
class ItemsController < ApplicationController
  before_filter :authify, :except => [:wholesaler_update, :render_label]
  before_filter :initialize_instance_variables, :except => [:render_label]
  before_filter :check_role, :except => [:info, :search, :labels,:render_label, :crumble, :wholesaler_update]
  before_filter :crumble, :except => [:wholesaler_update, :render_label]
  
  # GET /items
  # GET /items.xml
  def index
    if not check_license() then
      redirect_to :controller => "home", :action => "index" and return
    end
    @items = salor_user.get_items

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    if not check_license() then
      redirect_to :controller => "home", :action => "index" and return
    end
    @item = salor_user.get_item(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new :vendor_id => GlobalData.salor_user.meta.vendor_id
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.scopied.where(["id = ? or sku = ? or sku = ?",params[:id],params[:id],params[:keywords]]).first
    if not @item then
      redirect_to(:action => 'new', :notice => I18n.t("system.errors.item_not_found")) and return
    end
    add_breadcrumb @item.name,'edit_item_path(@item,:vendor_id => params[:vendor_id])'
   
  end

  # POST /items
  # POST /items.xml
  def create
    # We must insure that tax_profile is set first, otherwise, the
    # gross magic won't work
    # TODO Test this as it's no longer necessary
    @item = Item.new
    @item.tax_profile_id = params[:item][:tax_profile_id]
    @item.attributes = params[:item]
    @item.sku.upcase!

    respond_to do |format|
      if salor_user.owns_vendor?(@item.vendor_id) and @item.save
        @item.set_model_owner(salor_user)
        format.html { redirect_to(:action => 'new', :notice => I18n.t("views.notice.model_create", :model => Item.model_name.human)) }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def create_ajax
    @item = Item.new()
    @item.tax_profile_id = params[:item][:tax_profile_id]
    @item.attributes = params[:item]
    respond_to do |format|
      if salor_user.owns_vendor?(@item.vendor_id) and @item.save
        @item.set_model_owner(salor_user)
        format.json  { render :json => @item }
      else
        format.json  { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = salor_user.get_item(params[:id])
    saved = false
    params[:item][:sku].upcase!
    if @item.nil? then
      # puts  "item was nil!"
      @item = Item.new(params[:item])
      if @item.save then
        saved = true
      end
    else
      # puts  "Updating Item #{params[:item][:price_by_qty].to_i}"
      if params[:item][:price_by_qty].to_i == 1 then
        params[:item][:price_by_qty] = true
        # puts  "Set to true"
      else
        params[:item][:price_by_qty] = false
      end
      if @item.update_attributes(params[:item]) then
        saved = true
      end
    end
    respond_to do |format|
      if saved
        @item.set_model_owner(salor_user)
        format.html { redirect_to(:action => 'index', :notice => I18n.t("views.notice.model_edit", :model => Item.model_name.human)) }
        format.xml  { head :ok }
      else
        format.html { flash[:notice] = "There was an error!";render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end
  def update_real_quantity
    add_breadcrumb I18n.t("menu.update_real_quantity"), items_update_real_quantity_path
    if request.post? then
      @item = Item.scopied.find_by_sku(params[:sku])
      @item.update_attribute(:real_quantity, params[:quantity])
    end
  end
  def move_real_quantity
    Item.scopied.where("real_quantity > 0").each do |item|
      item.update_attribute(:quantity, item.real_quantity)
      item.update_attribute(:real_quantity, 0)
    end
    redirect_to items_update_real_quantity_path, :notice => t('views.notice.move_real_quantities_success')
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find_by_id(params[:id])
    if $User.owns_this?(@item) then
      if @item.order_items.any? then
        @item.update_attribute(:hidden,1)
        @item.update_attribute(:sku, rand(999).to_s + 'OLD:' + @item.sku)
      else
        @item.destroy
      end
    end

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end
  
  def info
    if params[:sku] then
      @item = Item.find_by_sku(params[:sku])
    else
      @item = Item.find(params[:id]) if Item.exists? params[:id]
    end
  end
  
  def search
    if not salor_user.owns_vendor? salor_user.meta.vendor_id then
      salor_user.meta.vendor_id = salor_user.get_default_vendor.id
    end
    @items = []
    @customers = []
    @orders = []
    if params[:klass] == 'Item' then
      @items = Item.scopied.page(params[:page]).per(GlobalData.conf.pagination)
    elsif params[:klass] == 'Order'
      if params[:keywords].empty? then
        @orders = Order.by_vendor.by_user.order("id DESC").page(params[:page]).per(GlobalData.conf.pagination)
      else
        @orders = Order.by_vendor.by_user.where("id = '#{params[:keywords]}' or tag LIKE '%#{params[:keywords]}%'").page(params[:page]).per(GlobalData.conf.pagination)
      end
    else
      @customers = Customer.scopied.page(params[:page]).per(GlobalData.conf.pagination)
    end
  end
  def item_json
    @item = Item.all_seeing.find_by_sku(params[:sku], :select => "name,sku,id")
  end
  def edit_location
    respond_to do |format|
      format.html 
      format.js { render :content_type => 'text/javascript',:layout => false}
    end
  end
  def render_label
     if params[:id]
      @items = Item.find_all_by_id params[:id]
    elsif params[:all]
      @items = Item.find_all_by_hidden :false
    elsif params[:skus]
       @items = Item.where :sku => CGI.unescape(params[:skus]).split("\n")
    end
    text = Printr.new.sane_template(params[:type],binding)
    render :text => text
  end

  def labels
    if params[:id]
      @items = Item.find_all_by_id params[:id]
    elsif params[:all]
      @items = Item.find_all_by_hidden :false
    elsif params[:skus]
      @items = Item.where :sku => params[:skus].split("\r\n")
    end
    vendor_id = GlobalData.salor_user.meta.vendor_id
      if params[:type] == 'label'
        type = 'escpos'
      elsif params[:type] == 'sticker'
        type = 'slcs'
      end
      text = Printr.new.sane_template(params[:type],binding)
      File.open($Register.thermal_printer,'w') do |f|
        f.write text
      end
    render :nothing => true
  end
  def export_broken_items
    @from, @to = assign_from_to(params)
    if params[:from] then
      @items = BrokenItem.scopied.where(["created_at between ? and ?", @from.beginning_of_day, @to.end_of_day])
      text = []
      if @items.any? then
        text << @items.first.csv_header
      end
      @items.each do |item|
        text << item.to_csv
      end
      render_csv "broken_items", text.join("\n") and return
    end
  end
  
  def reorder_recommendation
    text = Item.recommend_reorder(params[:type])
    if not text.nil? and not text.empty? then
      send_data text,:filename => "Reorder" + Time.now.strftime("%Y%m%d%H%I") + ".csv", :type => "application/x-csv"
    else
      redirect_to :action => :index, :notice => I18n.t("system.errors.cannot_reorder")
    end
    
  end

  def upload
    if params[:file]
      lines = params[:file].read.split("\n")
      # This works like x,y,z = list(array) in PHP, i.e. multiple assignment from an array. Just FYI
      i, updated_items, created_items, created_categories, created_tax_profiles = FileUpload.new.salor(lines)
      redirect_to(:action => 'upload')
    end
  end

  def upload_danczek_tobaccoland_plattner
    if params[:file]
      lines = params[:file].read.split("\n")
      i, updated_items, created_items, created_categories, created_tax_profiles = FileUpload.new.type1(lines)
      redirect_to(:action => 'index')
    end
  end

  def upload_house_of_smoke
    if params[:file]
      lines = params[:file].read.split("\n")
      i, updated_items, created_items, created_categories, created_tax_profiles = FileUpload.new.type2(lines)
      redirect_to(:action => 'index')
    end
  end

  def upload_optimalsoft
    if params[:file]
      lines = params[:file].read.split("\n")
      i, updated_items, created_items, created_categories, created_tax_profiles = FileUpload.new.type3(lines)
      redirect_to(:action => 'index')
    end
  end
  
  def wholesaler_update
    a = Mechanize.new
    uploader = FileUpload.new
    GlobalData.conf.csv_imports.split("\n").each do |line|
      parts = line.chomp.split(',')
      next if parts[0].nil?
      begin
      file = a.get(GlobalData.conf.csv_imports_url + "/" + parts[0])
      uploader.send(parts[1].to_sym, file.body.split("\n")) # i.e. we dynamically call the function to process
      # this .csv file, this is set in the vendor.salor_configuration as filename.csv,type1|type2 ...
      rescue
        GlobalErrors << ["WholeSaleImportError",$!.to_s + " For " + parts[0].to_s,nil]
      end
    end
    respond_to do |format|
      format.html { render :text => "Complete"}
      format.js { render :content_type => 'text/javascript',:layout => false}
    end
  end

  def download
    @items = Item.scopied
    render 'list.csv'
  end

  def inventory_report
    add_breadcrumb I18n.t("menu.update_real_quantity"), items_update_real_quantity_path
    add_breadcrumb I18n.t("menu.inventory_report"), items_inventory_report_path
    @items = Item.scopied.where 'real_quantity > 0'
    @items.inspect
    @categories = Category.scopied
  end

  private 
  def crumble
    @vendor = salor_user.get_vendor(salor_user.meta.vendor_id)
    add_breadcrumb @vendor.name,'vendor_path(@vendor)'
    add_breadcrumb I18n.t("menu.items"),'items_path(:vendor_id => params[:vendor_id])'
  end
end
