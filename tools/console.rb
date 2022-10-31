require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###
author1 = Author.new("Jevans")
magazine1 = Magazine.new("Name","Categ1")
magazine2 = Magazine.new("Name2","Categ2")
article1 = Article.new(author1, magazine1, "Title")
author2 = Author.new("OtienoJ")
art2 = Article.new(author1, magazine1, "Title22")
art3 = Article.new(author2,magazine1,"Title3")
art4 = author2.add_article(magazine1, "Title33")
art5 = author2.add_article(magazine2, "Title5")
author1.add_article(magazine1, "Title44")


### DO NOT REMOVE THIS
binding.pry

0
