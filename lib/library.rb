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
end
