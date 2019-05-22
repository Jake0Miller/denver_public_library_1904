require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'
require './lib/library'

class LibraryTest < Minitest::Test
  def setup
    @dpl = Library.new("Denver Public Library")
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @professor = @charlotte_bronte.write("The Professor", "1857")
    @villette = @charlotte_bronte.write("Villette", "1853")
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_attributes
    assert_equal "Denver Public Library", @dpl.name
    assert_equal [], @dpl.books
    assert_equal [], @dpl.authors
  end

  def test_holds_authors
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    assert_equal [@charlotte_bronte, @harper_lee], @dpl.authors
  end

  def test_holds_books
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    expected = [@jane_eyre, @professor, @villette, @mockingbird]
    assert_equal expected, @dpl.books
  end

  def test_publication_time_frame_for_author
    expected = {:start=>"1847", :end=>"1857"}
    assert_equal expected, @dpl.publication_time_frame_for(@charlotte_bronte)
    expected = {:start=>"1960", :end=>"1960"}
    assert_equal expected, @dpl.publication_time_frame_for(@harper_lee)
  end

  def test_checkout
    assert_equal [], @dpl.checked_out_books
    assert_equal false, @jane_eyre.checkout

    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    assert_equal true, @jane_eyre.checkout
    assert_equal [@jane_eyre], @dpl.checked_out_books
    assert_equal false, @jane_eyre.checkout
    assert_equal true, @mockingbird.checkout

    @dpl.return(@jane_eyre)

    assert_equal [@mockingbird], @dpl.checked_out_books

    @dpl.checkout(@jane_eyre)

    assert_equal [@mockingbird, @jane_eyre], @dpl.checked_out_books
    assert_equal @jane, @dpl.most_popular_book
  end
end
