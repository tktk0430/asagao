# frozen_string_literal: true

class TopController < ApplicationController
  def index
    @message = 'おはようございます'
  end

  def about
    @page_title
  end
end
