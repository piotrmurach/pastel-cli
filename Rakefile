# frozen_string_literal: true

require "kramdown"
require "bundler/gem_tasks"

FileList["tasks/**/*.rake"].each(&method(:import))

desc "Run all specs"
task ci: %w[ spec ]

namespace :man do
  file "man/pastel.1" => "man/pastel.1.md" do
    puts "Generating pastel man page"
    File.open("man/pastel.1", "w+") do |f|
      data = File.read("man/pastel.1.md")
      f.write(Kramdown::Document.new(data).to_man)
    end
  end

  desc "Build the pastel man page"
  task :build => "man/pastel.1"

  desc "Clean up the man page"
  task :clean do
    rm "man/pastel.1"
  end
end
