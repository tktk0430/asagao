# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private def current_member
    Member.find(session[:member_id]) if session[:member_id]
  end
  helper_method :current_member

  class LoginRequired < StandardError; end
  class Forbiddend < StandardError; end

  private def login_required
    raise LoginRequired unless current_member
  end

  private def correct_member
    raise Forbiddend unless current_member.id == params[:id].to_i
  end
end
