require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'

class BookTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_attributes
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
    assert_equal [], @charlotte_bronte.books

    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    assert_instance_of Book, jane_eyre

    villette = @charlotte_bronte.write("Villette", "1853")

    assert_equal [jane_eyre, villette], @charlotte_bronte.books
  end
end