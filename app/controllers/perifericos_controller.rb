class PerifericosController < ApplicationController
  # GET /perifericos
  # GET /perifericos.xml
  def index
    @perifericos = Periferico.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @perifericos }
    end
  end

  # GET /perifericos/1
  # GET /perifericos/1.xml
  def show
    @periferico = Periferico.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @periferico }
    end
  end

  # GET /perifericos/new
  # GET /perifericos/new.xml
  def new
    @periferico = Periferico.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @periferico }
    end
  end

  # GET /perifericos/1/edit
  def edit
    @periferico = Periferico.find(params[:id])
  end

  # POST /perifericos
  # POST /perifericos.xml
  def create
    @periferico = Periferico.new(params[:periferico])

    respond_to do |format|
      if @periferico.save
        format.html { redirect_to(@periferico, :notice => 'Periferico was successfully created.') }
        format.xml  { render :xml => @periferico, :status => :created, :location => @periferico }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @periferico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /perifericos/1
  # PUT /perifericos/1.xml
  def update
    @periferico = Periferico.find(params[:id])

    respond_to do |format|
      if @periferico.update_attributes(params[:periferico])
        format.html { redirect_to(@periferico, :notice => 'Periferico was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @periferico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /perifericos/1
  # DELETE /perifericos/1.xml
  def destroy
    @periferico = Periferico.find(params[:id])
    @periferico.destroy

    respond_to do |format|
      format.html { redirect_to(perifericos_url) }
      format.xml  { head :ok }
    end
  end
end
