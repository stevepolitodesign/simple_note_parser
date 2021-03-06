require "simple_note_parser/base"
require "csv"

module SimpleNoteParser
  class Processor < SimpleNoteParser::Base
    attr_accessor :file, :destination, :headers

    def initialize(file: "./source/notes.json", destination: "./dist", headers: %w[title content tags])
      @file = file
      @destination = destination
      @headers = headers
    end

    def save_as_csv
      json_data = load_json_data(file)
      notes = parse_json_data(json_data)
      create_directory(destination)
      create_csv
      process_notes(notes)
    end

    private

    def csv_path
      destination + "/notes.csv"
    end

    def process_notes(notes)
      CSV.open(csv_path, "wb", headers: true) do |csv|
        csv << headers
        notes.each do |note|
          add_row_to_csv(note, csv)
        end
      end
    end
    
    def add_row_to_csv(note, csv)
      title = note["content"].split("\r").first
      content = note["content"]
      tags = note["tags"]
      formatted_tags = tags.join(", ") unless tags.nil?
      csv << [title, content, formatted_tags]
    end

    def create_csv
      CSV.new(csv_path, headers: true)
    end

  end
end
