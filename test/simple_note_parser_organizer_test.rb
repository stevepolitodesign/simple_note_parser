require "test_helper"
require "simple_note_parser/organizer"

class SimpleNoteParser::OrganizerTest < Minitest::Test
    def setup
        @notes = SimpleNoteParser::Organizer.new
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
        assert_equal "./dist/organized-by-tags", @notes.destination
    end

    def test_that_it_responds_to_organize_by_tag
        assert_respond_to @notes, :organize_by_tag
    end

    def test_that_it_responds_to_clean
        assert_respond_to @notes, :clean
    end

    def test_that_it_oranizes_files_by_tag
        tags = %w[foo bar baz no-tags]
        @notes = SimpleNoteParser::Organizer.new(file: @file, destination: @destination)
        @notes.organize_by_tag
        FileUtils.cd(@destination)
        tags.each do |tag|
            FileUtils.cd(__dir__ + "/tmp/" + tag)
            note = Dir.entries(FileUtils.pwd).select {|f| File.file? f}.first
            file = File.open(FileUtils.pwd + "/" + note)
            assert file.read
        end
    end

    def test_that_clean_method_removes_desination
        @notes = SimpleNoteParser::Organizer.new(file: @file, destination: @destination)
        @notes.clean
        assert_raises(Errno::ENOENT) do
            FileUtils.cd(@destination)
        end
    end
end