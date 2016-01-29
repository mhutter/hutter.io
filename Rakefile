desc 'build the site'
task :build do
  system 'bundle exec jekyll build'
end

desc 'remove the built site'
task :clean do
  dir = File.expand_path('../_site', __FILE__)
  puts "===> removing #{dir}"
  system "rm -rf #{dir}"
end

desc 'rebuild the site from scratch'
task :rebuild => [:clean, :build]

desc 'deploy site to the webserver'
task :deploy => [:rebuild] do
  system 'rsync -aPz --delete _site/ hutter.io:public_html/hutter.io/'
end
