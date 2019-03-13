# frozen_string_literal: true

class MembersController < ApplicationController
  def index
    @members = Member.order('number')
  end

  def show
    @member = Member.find_by(id: params[:id])
  end

  def new
    @member = Member.new(birthday: Date.new(1980, 1, 1))
  end

  def edit
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to :members, notice:"会員を登録しました"
    else
      flash.now[:notice]="作成できませんでした"
      render "new"
    end
  end

  def update
    @member=Member.find(params[:id])
    @member.assign_attributes(params[:member])#form_for @memberなので全編集データをparams[member]で受け取れる
    if @member.save
      redirect_to @member, notice:"会員情報を更新しました"
    else
      flash.now[:notice]="更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @member=Member.find(params[:id])
    @member.destroy
    redirect_to :members, notice:"会員情報を削除しました"
  end

  def search
    @members = Member.search(params[:q])
    render 'index'
  end
end
