class ComodosController < ApplicationController
  # GET /comodos
  # GET /comodos.xml
  def index
    @comodos = Comodo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comodos }
    end
  end

  # GET /comodos/1
  # GET /comodos/1.xml
  def show
    @comodo = Comodo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comodo }
    end
  end

  # GET /comodos/new
  # GET /comodos/new.xml
  def new
    @comodo = Comodo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comodo }
    end
  end

  # GET /comodos/1/edit
  def edit
    @comodo = Comodo.find(params[:id])
  end

  # POST /comodos
  # POST /comodos.xml
  def create
    @comodo = Comodo.new(params[:comodo])

    respond_to do |format|
      if @comodo.save
        format.html { redirect_to(@comodo, :notice => 'Comodo was successfully created.') }
        format.xml  { render :xml => @comodo, :status => :created, :location => @comodo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comodo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comodos/1
  # PUT /comodos/1.xml
  def update
    @comodo = Comodo.find(params[:id])

    respond_to do |format|
      if @comodo.update_attributes(params[:comodo])
        format.html { redirect_to(@comodo, :notice => 'Comodo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comodo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comodos/1
  # DELETE /comodos/1.xml
  def destroy
    @comodo = Comodo.find(params[:id])
    @comodo.destroy

    respond_to do |format|
      format.html { redirect_to(comodos_url) }
      format.xml  { head :ok }
    end
  end
end
