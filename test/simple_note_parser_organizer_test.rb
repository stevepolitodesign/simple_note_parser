require "test_helper"
require "simple_note_parser/organizer"

class SimpleNoteParser::OrganizerTest < Minitest::Test
    def setup
        @notes = SimpleNoteParser::Organizer.new
    end

    def test_that_it_can_be_instantiated
        assert @notes
    end
end