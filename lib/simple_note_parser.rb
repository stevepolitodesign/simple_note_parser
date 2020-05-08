require "simple_note_parser/version"
require "json"
require "fileutils"
class SimpleNoteParser
  attr_accessor :file, :destination

  def initialize(file = "./data/notes.json", destination = "./dist")
    @file = file
    @destination = destination
  end

  def clean
    FileUtils.rm_rf(destination)
  end

  def import
    json_data = load_json_data(file)
    notes = parse_json_data(json_data)
    process_notes(notes)
  end

  private

  def load_json_data(path)
    file = File.open path
    json_data = JSON.load file
  end

  def parse_json_data(json_data)
    notes = json_data["activeNotes"]
  end

  def process_notes(notes)
    notes.each do |note|
      tags = note["tags"]
      if tags.nil? || tags.empty?
        path = "#{destination}/no-tags"
        create_directory(path)
        create_file(path, note)
      else
        tags.each do |tag|
          path = "#{destination}/#{tag.downcase}"
          create_directory(path)
          create_file(path, note)
        end
      end
    end
  end

  def create_directory(path)
    FileUtils.mkdir_p(path) unless Dir.exist?(path)
  end

  def create_file(path, note)
    first_line = note["content"].split("\r").first
    name = first_line.downcase.strip.tr(" ", "-").gsub(/[^\w-]/, "")
    content = note["content"]
    File.open("#{path}/#{name}.txt", "w") { |f| f.write content }
  end
end
