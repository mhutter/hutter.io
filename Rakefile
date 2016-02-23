desc 'start the preview server'
task :serve do
  system 'bundle exec jekyll serve -H 0.0.0.0'
end

desc 'build the site'
task :build do
  puts "===> building site..."
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
  puts "===> uploading site"
  system 'rsync -aPz --delete _site/ hutter.io:public_html/hutter.io/'
end

namespace :new do
  desc 'create a new post'
  task :post do
    # ask for title
    print 'Title: '
    title = $stdin.gets.chomp

    # determine folder
    print 'Draft? (y/N): '
    folder = $stdin.getc.downcase.eql?('y') ? '_drafts' : '_posts'

    # construct file name
    fname = Time.now.strftime('%Y-%m-%d') + '-'
    fname << title.downcase.gsub(/[^a-z0-9]+/, '-').gsub(/-+$/, '')
    fname << '.md'

    # construct file path
    path = File.expand_path(File.join('..', folder, fname), __FILE__)

    # check whether file already exists, and complain if so
    fail "This post already exists - #{path}" if File.exist?(path)

    # write new file
    File.open(path, 'w') do |f|
      f.puts <<~EOT
        ---
        layout: post
        title: #{title}
        #excerpt: Write me!
        #tags: [foo,bar]
        ---
      EOT
    end

    puts "===> Wrote new post: #{path}"
  end # new:post
end
