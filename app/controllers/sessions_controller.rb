# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    member = Member.find_by(name: params[:name])
    if params[:test_user].present?
      member=Member.find_by(name: "king")
      params[:password]="asagao!"
    end
    if member&.authenticate(params[:password])
      session[:member_id] = member.id
      flash.notice = 'ログインしました'
    else
      flash.alert = '名前とパスワードが一致しません'
    end
    redirect_to '/'
  end

  def destroy
    session.delete(:member_id)
    flash.notice = 'ログアウトしました'
    redirect_to '/'
  end
end
# ログイン処理をコントロールする。session情報をcreate(ログイン), destroy(ログアウト)
