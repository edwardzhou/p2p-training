class Admin::CouponsController < Admin::BaseController
  # GET /admin/coupons
  # GET /admin/coupons.xml
  def index
    @admin_coupons = Coupon.all

    respond_to do |format|
      format.html # index.html.haml
      format.xml  { render :xml => @admin_coupons }
    end
  end

  # GET /admin/coupons/1
  # GET /admin/coupons/1.xml
  def show
    @admin_coupon = Coupon.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.xml  { render :xml => @admin_coupon }
    end
  end

  # GET /admin/coupons/new
  # GET /admin/coupons/new.xml
  def new
    new_code = Guid.new.to_s.gsub("-", "")
    @admin_coupon = Coupon.new({:coupon_code => new_code})

    respond_to do |format|
      format.html # new.html.haml
      format.xml  { render :xml => @admin_coupon }
    end
  end

  # GET /admin/coupons/1/edit
  def edit
    @admin_coupon = Coupon.find(params[:id])
  end

  # POST /admin/coupons
  # POST /admin/coupons.xml
  def create
    @admin_coupon = Coupon.new(params[:coupon])

    respond_to do |format|
      if @admin_coupon.save
        format.html { redirect_to([:admin, @admin_coupon], :notice => 'Coupon was successfully created.') }
        format.xml  { render :xml => @admin_coupon, :status => :created, :location => @admin_coupon }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin_coupon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/coupons/1
  # PUT /admin/coupons/1.xml
  def update
    @admin_coupon = Coupon.find(params[:id])

    respond_to do |format|
      if @admin_coupon.update_attributes(params[:coupon])
        format.html { redirect_to([:admin, @admin_coupon], :notice => 'Coupon was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_coupon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/coupons/1
  # DELETE /admin/coupons/1.xml
  def destroy
    @admin_coupon = Coupon.find(params[:id])
    @admin_coupon.destroy

    respond_to do |format|
      format.html { redirect_to(admin_coupons_url) }
      format.xml  { head :ok }
    end
  end
end
