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
    print 'Title: '
    title = $stdin.gets.chomp
    filename = Time.now.strftime('%Y-%m-%d') + '-'
    filename << title.downcase.gsub(/[^a-z0-1]+/, '-').gsub(/-+$/, '')
    filename << '.md'
    path = File.expand_path("../_posts/#{filename}", __FILE__)
    if File.exist?(path)
      fail "This post already exists! `#{path}`"
    else
      File.open(path, 'w') do |f|
        f.puts '---'
        f.puts 'layout: post'
        f.puts %Q{title: "#{title}"}
        f.puts '# excerpt: Write me!'
        f.puts '---'
      end
      puts "Wrote new Post: #{path}"
    end
  end
end
