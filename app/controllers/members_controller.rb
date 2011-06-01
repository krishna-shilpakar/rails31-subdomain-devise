class MembersController < ApplicationController
  #under normal conditions, use before_filter :authenticate_user!, but this is a demo so it has been replace
  #before_filter :authenticate_user!
  
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  before_filter :new
  
  before_filter :check_account


  # GET /members
  # GET /members.xml
  def index
    @members = Member.where(:account_id => current_user.account_id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @members }
    end
  end

  # GET /members/1
  # GET /members/1.xml
  def show
    #@member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /members/new
  # GET /members/new.xml
  def new
    #new is not valid route, if id = new, redirect
    if params[:id] == "new"
      redirect_to :members, :alert => "New action on members disabled, use invite"
    end
  end

  # GET /members/1/edit
  def edit
    #@member = Member.find(params[:id])
  end


  # PUT /members/1
  # PUT /members/1.xml
  def update
    #@member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to(@member, :notice => 'Member was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.xml
  def destroy
    #@member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to(members_url) }
      format.xml  { head :ok }
    end
  end
  
  def check_account
    if @member
      is_account_resource?(@member.account_id)
    end
  end
end
