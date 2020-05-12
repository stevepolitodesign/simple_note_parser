require "simple_note_parser/base"
module SimpleNoteParser
  class Processor
    attr_accessor :file, :destination

    def initialize(file: "./source/notes.json", destination: "./dist")
      @file = file
      @destination = destination
    end

    def save_as_csv
    end

    private

    def process_notes(notes)
    end

  end
end
