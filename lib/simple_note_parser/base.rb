require "fileutils"

module SimpleNoteParser
  class Base
    attr_accessor :file, :destination

    def initialize(file = "./source/notes.json", destination = "./organized-by-tag")
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

    def create_directory(path)
      FileUtils.mkdir_p(path) unless Dir.exist?(path)
    end
  end
end
