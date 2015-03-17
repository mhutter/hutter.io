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
