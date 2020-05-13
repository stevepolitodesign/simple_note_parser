require "test_helper"
require "simple_note_parser/base"

class SimpleNoteParser::BaseTest < Minitest::Test    
    def test_that_it_can_be_instantiated
        @notes = SimpleNoteParser::Base.new()
    end
end