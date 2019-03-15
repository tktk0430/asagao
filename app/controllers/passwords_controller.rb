class PasswordsController < ApplicationController
  def show
    redirect_to :account
  end

  def edit
    @member=current_member
  end

  def update
    @member=Member.find(session[:member_id])
    current_password=params[:account][:current_password]
    if current_password
      if @member.authenticate(current_password)
        @member.assign_attributes(params[:account])
        if @member.save
          redirect_to :account, notice:"パスワードを変更しました"
        else
          render "edit"
        end
      else
        @member.errors.add(:current_password, :wrong)
        render "edit"
      end
    else
      @member.errors.add(:current_password, :empty)
    end
  end
end
