require "test_helper"

class SimpleNoteParserTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SimpleNoteParser::VERSION
  end
end
