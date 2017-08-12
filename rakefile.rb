task :default do
    FileList["./test/chisel_test.rb", "./test/header_test.rb", "./test/paragrapher_test.rb", "./test/linker_test.rb", "./test/lister_test.rb"].each { |file| ruby file }
end
