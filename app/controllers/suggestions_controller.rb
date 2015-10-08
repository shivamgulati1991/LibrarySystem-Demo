class SuggestionsController < ApplicationController
	layout 'nav'

def new
	@suggestion = Suggestion.new
end


def index
 	@suggestions = Suggestion.all

end

def update
  @suggestion = Suggestion.find(params[:id])
 
  if @suggestion.update(suggestion_params)
  	Book.create(:ISBN=>@suggestion.ISBN,:author=>@suggestion.author,:title=>@suggestion.title,:description=>@suggestion.description,:status=>@suggestion.status,:check=>0)
  	@suggestion.destroy
    redirect_to @suggestion
  else
    render 'edit'
  end
end

def create
  @suggestion = Suggestion.new(suggestion_params)
 if @suggestion.save
    redirect_to @suggestion
  else
    render 'new'
  end
end

def show
    @suggestion = Suggestion.find(params[:id])
end

def edit
  @suggestion = Suggestion.find(params[:id])
end

def destroy
  @suggestion = Suggestion.find(params[:id])
  @suggestion.destroy
 
  redirect_to suggestions_path
end

private

  def suggestion_params
    params.require(:suggestion).permit(:ISBN, :author, :description, :title, :status)
  end

end
