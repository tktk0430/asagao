# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :login_required
  before_action :set_current_member

  def show; end

  def edit; end

  def update
    @member.assign_attributes(params[:account])
    if @member.save
      redirect_to :account, notice: 'アカウント情報を更新しました'
    else
      render 'edit'
    end
  end

  private def set_current_member
    @member = current_member
  end
end
