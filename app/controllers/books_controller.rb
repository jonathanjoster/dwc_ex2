class BooksController < ApplicationController
  # list all records
  def index
    @books = Book.all
    @book = Book.new
  end

  # create new record
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
    else # error hundler
      @books = Book.all
      render :index
    end
  end

  # detail the record
  def show
    @book = Book.find(params[:id])
  end

  # edit the record
  def edit
    @book = Book.find(params[:id])
  end

  # update the record
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = 'Book was successfully updated.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  # delete the record
  def destroy
    book= Book.find(params[:id])
    book.destroy
    flash[:success] = 'Book was successfully destroyed.'
    redirect_to books_path
  end

  private
  # get params securely
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
