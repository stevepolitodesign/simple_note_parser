require "simple_note_parser/base"
module SimpleNoteParser
  class Organizer < SimpleNoteParser::Base
    def organize_by_tag
      json_data = load_json_data(file)
      notes = parse_json_data(json_data)
      process_notes(notes)
    end

    private

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

    def create_file(path, note)
      first_line = note["content"].split("\r").first
      name = first_line.downcase.strip.tr(" ", "-").gsub(/[^\w-]/, "")
      content = note["content"]
      File.open("#{path}/#{name}.txt", "w") { |f| f.write content }
    end
  end
end
