class Api::V1::BooksController < ApplicationController    
  def index
    book = Books.all
    render json: { status: 'SUCCESS', book: book }
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: { status: 'SUCCESS', book: book }
    else
      render json: { status: 'FAILURE', book: book }
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      render json: { status: 'SUCCESS', book: book }
    else
      render json: { status: 'FAILURE', book: book }
    end
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :author, :category)
  end
end
