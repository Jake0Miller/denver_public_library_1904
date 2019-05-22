class Book
  attr_reader :author, :title, :publication_year, :checkouts
  def initialize(stats)
    @author = "#{stats[:author_first_name]} #{stats[:author_last_name]}"
    @title = stats[:title]
    @publication_year = stats[:publication_date].split(' ').last
    @checked_out = false
    @checkouts = 0
  end

  def checkout
    @checkouts += 1
    @checked_out = true
  end

  def return
    @checked_out = false
  end

  def checked_out?
    @checked_out
  end
end
