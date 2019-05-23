class Library
  attr_reader :name, :authors

  def initialize(name)
    @name = name
    @authors = []
  end

  def add_author(author)
    @authors << author
  end

  def books
    @authors.map { |author| author.books }.flatten
  end

  def publication_time_frame_for(author)
    books = author.books.minmax{|a,b| a.publication_year <=> b.publication_year}
    { start: books[0].publication_year, end: books[1].publication_year }
  end

  def checked_out_books
    books.find_all { |book| book.checked_out? }
  end

  def checkout(book)
    return false if !books.include?(book) || book.checked_out?
    book.checkout
    true
  end

  def return(book)
    book.return
  end

  def most_popular_book
    books.max { |a,b| a.checkouts <=> b.checkouts }
  end
end
