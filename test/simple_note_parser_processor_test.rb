require "test_helper"
require "simple_note_parser/processor"

class SimpleNoteParser::ProcessorTest < Minitest::Test
    def setup
        @notes = SimpleNoteParser::Processor.new
        @file = __dir__ + "/fixtures/notes.json"
        @destination = __dir__ + "/tmp"
    end

    def teardown
        FileUtils.rm_rf(@destination)
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

    def test_that_it_responds_to_save_as_csv
        assert_respond_to @notes, :save_as_csv
    end

    def test_that_it_responds_to_clean
        assert_respond_to @notes, :clean
    end

    def test_that_it_saves_as_csv
        @notes = SimpleNoteParser::Processor.new(file: @file, destination: @destination)
        @notes.save_as_csv
        FileUtils.cd(@destination)
        csv = CSV.read(@destination + "/notes.csv", headers: true)
        row = ["Note 2", "Note 2\r\nNote 2 Content", "Foo, Bar, Baz"]
        assert_equal %w[title content tags], CSV.open(@destination + "/notes.csv", &:readline)
        assert_equal row, CSV.read(@destination + "/notes.csv").last
    end

    def test_that_clean_method_removes_desination
        @notes = SimpleNoteParser::Processor.new(file: @file, destination: @destination)
        @notes.clean
        assert_raises(Errno::ENOENT) do
            FileUtils.cd(@destination)
        end
    end

end