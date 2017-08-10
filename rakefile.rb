task :default do
    FileList["./test/chisel_test.rb", "./test/header_test.rb", "./test/paragraph_test.rb", "./test/render_test.rb"].each { |file| ruby file }
end
