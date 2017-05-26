class UserController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /user_mails
  # GET /user_mails.json
  	def index
    	@users = User.all
  	end

  # GET /user_mails/1
  # GET /user_mails/1.json
  	def show
  	end

  # GET /user_mails/new
  	def new
    	@user = User.new
  	end

  # GET /user_mails/1/edit
  	def edit
  	end

  # POST /user_mails
  # POST /user_mails.json
  	def create

      name = params["name"]
  		email = params["email"]
      @user = User.new(:name => name,:email => email)
            
  		if @user.save
        send_mail =  UserNotifierMailer.send_signup_email(@user).deliver
        render :json => "User created"
        # render :json => send_mail
        # redirect_to(@user, :notice => 'User created')
        # render :json => send_mail
      else
        render :action => 'new'
      end
  		
    	# @user = User.new(user_params)

    	# respond_to do |format|
     #  		if @user.save
     #    		format.html { redirect_to @user, notice: 'User was successfully created.' }
     #    		format.json { render :show, status: :created, location: @user }
     #  		else
     #    		format.html { render :new }
     #    		format.json { render json: @user.errors, status: :unprocessable_entity }
     #  		end
    	# end

    	# # Create the user from params
    	# @user = User.new(params[:user])
    	# if @user.save
     #  	# Deliver the signup email
     #  		UserNotifier.send_signup_email(@user).deliver
     #  		redirect_to(@user, :notice => 'User created')
    	# else
     #  		render :action => 'new'
    	# end
  	end

  # PATCH/PUT /user_mails/1
  # PATCH/PUT /user_mails/1.json
  	def update
    	respond_to do |format|
      	if @user.update(user_params)
        	format.html { redirect_to @user, notice: 'User mail was successfully updated.' }
        	format.json { render :show, status: :ok, location: @user }
      	else
        	format.html { render :edit }
        	format.json { render json: @user.errors, status: :unprocessable_entity }
      	end
    	end
	end
  

  # DELETE /user_mails/1
  # DELETE /user_mails/1.json
  	def destroy
    	@user.destroy
    	respond_to do |format|
      		format.html { redirect_to user_url, notice: 'User mail was successfully destroyed.' }
      		format.json { head :no_content }
    	end
  	end

  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_mail
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :login)
    end
end


	

  