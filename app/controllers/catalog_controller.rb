class CatalogController < ApplicationController
  def view
    @catalog = Catalog.find(params[:id])
  end

end
