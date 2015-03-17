require 'rake'


desc 'Build the site'
task :build do
  system 'bundle exec jekyll build'
end


desc 'Remove the built site'
task :clean do
  dir = File.expand_path('../_site', __FILE__)
  puts "removing #{dir}"
  system "rm -rf #{dir}"
end


desc 'Rebuild the site from scratch'
task :rebuild => [:clean, :build]


desc 'Upload the site'
task :deploy => [:build] do
  system 'rsync -aPz --delete _site/ mhutter.net:public_html/mhutter.net/'
end


namespace :new do
  desc 'Create a new Post'
  task :post do
    # ask for the title
    print 'Title: '
    title = $stdin.gets.chomp

    # determine the folder
    print 'Draft? (y/N): '
    folder = $stdin.getc.downcase.eql?('y') ? '_drafts' : '_posts'

    # construct the file name
    filename = Time.now.strftime('%Y-%m-%d') + '-'
    filename << title.downcase.gsub(/[^a-z0-1]+/, '-').gsub(/-+$/, '')
    filename << '.md'

    # construct the file path
    path = File.expand_path("../#{folder}/#{filename}", __FILE__)

    # check whether the file already exists (and complain if so)
    fail "This post already exists! `#{path}`" if File.exist?(path)

    # write the new post
    File.open(path, 'w') do |f|
      f.puts '---'
      f.puts 'layout: post'
      f.puts %Q{title: "#{title}"}
      f.puts '# excerpt: Write me!'
      f.puts '---'
    end

    # Do good and talk about it
    puts "Wrote new Post: #{path}"
  end # new:post

end
