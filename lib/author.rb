class Author
  attr_reader :name, :books

  def initialize(stats)
    @first_name = stats[:first_name]
    @last_name = stats[:last_name]
    @name = @first_name + ' ' + @last_name
    @books = []
  end

  def write(title, publication_date)
    @books << Book.new({author_first_name: @first_name,
                        author_last_name: @last_name,
                        title: title,
                        publication_date: publication_date})
    @books.last
  end
end
