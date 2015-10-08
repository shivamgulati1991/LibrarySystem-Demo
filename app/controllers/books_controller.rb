class BooksController < ApplicationController
	layout 'nav'
	#layout :choose_layout

def new
	@book = Book.new
end

def edit
  @book = Book.find(params[:id])
end

def update
  @book = Book.find(params[:id])
 
  if @book.update(book_params)
    redirect_to @book
  else
    render 'edit'
  end
end

def create
  @book = Book.new(book_params)
 if @book.save
    redirect_to @book
  else
    render 'new'
  end
end

def checkout

  @book = Book.find(params[:id])
  @user = User.find_by(name: session[:user_name])
  @email = User.find_by(email: session[:user_email])

 	User.all.each do |user|
  	
	if user.want_book == 2 && @book.want_book ==2
		UserMailer.welcome_email(user.email).deliver_now
		user.want_book = 0
		@book.want_book = 0
	end
		
	end
        
       
        @name = params[:Name]
	checkoutUserupdate
        
end

def mail
  @book = Book.find(params[:id])
   @user = User.find_by(name: session[:user_name])
   @email = User.find_by(email: session[:user_email])
  @user.update_attribute(:want_book, 2) 
  @book.update_attribute(:want_book, 2)         
end

def checkoutUserupdate
	
	
	user = User.find_by(email: @name)
	
	if user.present?
	flash[:success] = "The book has been successfully updated on behalf of #{user.email}"
	#user.update_attribute(:check, 1) 
	@book = Book.find(params[:id])
	@book.user = User.find_by(email: @name)
	
	if @book.status == "Available" 
	@book.update_attribute(:status, "Checked Out")
	user.update_attribute(:check, 1)
	user.update_attribute(:ISBN, @book.ISBN)
	@book.update_attribute(:email, user.email)
	else
	@book.update_attribute(:status, "Available")
	user.update_attribute(:check, 0)
	user.update_attribute(:ISBN, ' ')
    @book.update_attribute(:email, ' ')
	end
  History.create(:name=>user.name,:email=>user.email,:ISBN=>@book.ISBN,:author=>@book.author,:title=>@book.title,:description=>@book.description,:status=>@book.status)
	#@user1 = User.find_by(name: session[:user_name])
 	#@user1.update_attribute(:check, 0) 
	end
	
end

def checkoutupdate
  @book = Book.find(params[:id])
  user = User.find_by(email: session[:user_email])
  #if @book.update(book_params)
   
          
    if user.check == false && @book.status== "Available"
 	user.update_attribute(:check, 1)
 	user.update_attribute(:ISBN, @book.ISBN)
 	@book.update_attribute(:email, user.email)
 	@book.update_attribute(:status, "Checked Out")
	#@book.user = User.find_by(email: session[:user_email])
           
        
    elsif user.check == true && @book.status== "Checked Out"
        user.update_attribute(:check, 0)
        user.update_attribute(:ISBN, ' ')
        @book.update_attribute(:email, ' ')
        @book.update_attribute(:status, "Available")
        #@book.user = User.find_by(email: session[:user_email])
    end
   History.create(:name=>user.name,:email=>user.email,:ISBN=>@book.ISBN,:author=>@book.author,:title=>@book.title,:description=>@book.description,:status=>@book.status) 
    
  redirect_to books_path

  #else
   # render 'edit'
  #end
end

def index
 	@books = Book.all
 	@books = @books.search(params[:search]) if params[:search].present?   
end

def show
    @book = Book.find(params[:id])
end

def destroy
  @book = Book.find(params[:id])
  @book.destroy
 
  redirect_to books_path
end

private

  def book_params
    params.require(:book).permit(:ISBN, :author, :description, :title, :status, :check, :want_book,:email)
  end


end
