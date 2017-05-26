class UserMailsController < ApplicationController
  before_action :set_user_mail, only: [:show, :edit, :update, :destroy]

  # GET /user_mails
  # GET /user_mails.json
  def index
    @user_mails = UserMail.all
  end

  # GET /user_mails/1
  # GET /user_mails/1.json
  def show
  end

  # GET /user_mails/new
  def new
    @user_mail = UserMail.new
  end

  # GET /user_mails/1/edit
  def edit
  end

  # POST /user_mails
  # POST /user_mails.json
  def create
    @user_mail = UserMail.new(user_mail_params)

    respond_to do |format|
      if @user_mail.save
        format.html { redirect_to @user_mail, notice: 'User mail was successfully created.' }
        format.json { render :show, status: :created, location: @user_mail }
      else
        format.html { render :new }
        format.json { render json: @user_mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_mails/1
  # PATCH/PUT /user_mails/1.json
  def update
    respond_to do |format|
      if @user_mail.update(user_mail_params)
        format.html { redirect_to @user_mail, notice: 'User mail was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_mail }
      else
        format.html { render :edit }
        format.json { render json: @user_mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_mails/1
  # DELETE /user_mails/1.json
  def destroy
    @user_mail.destroy
    respond_to do |format|
      format.html { redirect_to user_mails_url, notice: 'User mail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_mail
      @user_mail = UserMail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_mail_params
      params.require(:user_mail).permit(:name, :email, :login)
    end
end
