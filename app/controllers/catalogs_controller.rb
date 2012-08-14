class CatalogsController < ApplicationController
  before_filter :managerAuthorize
  
  # GET /catalogs
  # GET /catalogs.xml
  def index

    @catalogs = Catalog.find_all_by_pid("root");

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @catalogs }
    end
  end

  # GET /catalogs/1
  # GET /catalogs/1.xml
  def show
    @catalog = Catalog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @catalog }
    end
  end

  # GET /catalogs/new
  # GET /catalogs/new.xml
  def new
    @catalog = Catalog.new
    @catalog.pid = params[:pid]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @catalog }
    end
  end

  # GET /catalogs/1/edit
  def edit
    @catalog = Catalog.find(params[:id])
  end

  # POST /catalogs
  # POST /catalogs.xml
  def create
    @catalog = Catalog.new(params[:catalog])

    respond_to do |format|
      if @catalog.save
        format.html { redirect_to(@catalog, :notice => 'Catalog was successfully created.') }
        format.xml  { render :xml => @catalog, :status => :created, :location => @catalog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @catalog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /catalogs/1
  # PUT /catalogs/1.xml
  def update
    @catalog = Catalog.find(params[:id])

    respond_to do |format|
      if @catalog.update_attributes(params[:catalog])
        format.html { redirect_to(@catalog, :notice => 'Catalog was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @catalog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogs/1
  # DELETE /catalogs/1.xml
  def destroy
    @catalog = Catalog.find(params[:id])
    @catalog.destroy

    respond_to do |format|
      format.html { redirect_to(catalogs_url) }
      format.xml  { head :ok }
    end
  end

end
