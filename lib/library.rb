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
    start = author.books.min {|a,b| a.publication_year <=> b.publication_year}
    start = start.publication_year
    fin = author.books.max {|a,b| a.publication_year <=> b.publication_year}
    fin = fin.publication_year
    { start: start, end: fin }
  end
end
