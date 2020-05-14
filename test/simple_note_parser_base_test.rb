require "test_helper"
require "simple_note_parser/base"

class SimpleNoteParser::BaseTest < Minitest::Test
    def setup
        @notes = SimpleNoteParser::Base.new
    end

    def test_that_it_can_be_instantiated
        assert @notes
    end

    def test_that_it_has_a_default_file_value
        assert_equal "./source/notes.json", @notes.file
    end

    def test_that_it_has_a_default_destination_value
        assert_equal "./dist", @notes.destination
    end

    def test_that_it_reponds_to_clean
        assert_respond_to @notes, :clean
    end
end