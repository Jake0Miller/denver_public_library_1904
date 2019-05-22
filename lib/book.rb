class Book
  attr_reader :author, :title, :publication_year
  def initialize(stats)
    @author = "#{stats[:author_first_name]} #{stats[:author_last_name]}"
    @title = stats[:title]
    @publication_year = stats[:publication_date].split(' ').last
  end
end
