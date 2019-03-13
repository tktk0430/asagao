# frozen_string_literal: true

class LessonController < ApplicationController
  def step1
    render plain: "こんにちは、#{params[:name]}"
  end

  def step2
    @user_ip = request.remote_ip
    @user_env = request.env
    @user_header = request.headers
    # render plain: "このコントローラは#{params[:controller]}で、アクションは#{params[:action]}です"
    render plain: @user_header.to_s
    # render plain:
    # render plain:
  end

  def step3
    flash.now[:error] = '一瞬だけうつるよ'
    render '/top/index'
  end

  def step4
    @comment = '<script>alert("!")</script>'
  end

  list.eac
end
