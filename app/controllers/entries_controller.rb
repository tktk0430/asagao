class EntriesController < ApplicationController
  def index
    if params[:member_id] #member_idの書いた記事
      @member=Member.find(params[:member_id])
      @entries=@member.entries
    else #member_idがなければ全部
      @entries=Entry.all
    end
    @entries=@entries.readable_for(current_member).order(posted_at: :desc).page(params[:page]).per(3)
    #current_memberがいればreadable_forによりfull(current_member)が呼ばれ、「current_memberが書いたもの」「draftじゃないもの」が
    #呼ばれる。current_memberがいなければcommonで絞られる。    
  end

  def show
    @entry=Entry.readable_for(current_member).find(params[:id])
  end

  def new
    @entry=Entry.new(posted_at: Time.current)
  end

  def edit
    @entry=current_member.entries.find(params[:id])
  end

  def create
    @entry=Entry.new(params[:entry])
    @entry.author=current_member
    if @entry.save
      redirect_to @entry, notice: "記事を作成しました"
    else
      render "new"
    end
  end

  def update
    @entry=current_member.entries.find(params[:id])
    @entry.assign_attributes(params[:entry])
    if @entry.save
      redirect_to @entry, notice: "記事を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @entry=current_member.entries.find(params[:id])
    @entry.destroy
    redirect_to [@entry.author, :entries], notice: "記事を更新しました"
  end
end
