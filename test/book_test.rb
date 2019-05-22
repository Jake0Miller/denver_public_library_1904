require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'

class BookTest < Minitest::Test
  def setup
    @book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
  end

  def test_it_exists
    assert_instance_of Book, @book
  end

  def test_attributes
    @book.title = "To Kill a Mockingbird"
    @book.publication_year = "1960"
    @book.author = "Harper Lee"
  end
end
