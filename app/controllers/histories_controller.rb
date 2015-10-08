class HistoriesController < ApplicationController
	layout "nav"
	
def index
 	@histories = History.all
 	@histories = @histories.search(params[:search]) if params[:search].present?   

end
end
