class ErrorsController < ApplicationController
  def show
    error_id = params[:id]
    render "#{error_id}"
  end
end
