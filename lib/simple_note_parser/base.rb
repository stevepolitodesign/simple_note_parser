require "json"
require "fileutils"
module SimpleNoteParser
  class Base
    attr_accessor :file, :destination

    def initialize(file: "./source/notes.json", destination: "./dist")
      @file = file
      @destination = destination
    end

    def clean
      FileUtils.rm_rf(destination)
    end

    private

    def load_json_data(path)
      file = File.open path
      json_data = JSON.load file
    end

    def parse_json_data(json_data)
      json_data["activeNotes"]
    end

    def create_directory(path)
      FileUtils.mkdir_p(path) unless Dir.exist?(path)
    end
  end
end
