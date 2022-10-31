# Please copy/paste all three classes into this file to submit your solution!

#Author class methods
class Author
    attr_reader :name
  
    def initialize(name)
      @name = name
    end
  
    def articles
      Article.all.filter{|article|
        article.author == self.name}
    end
  
    def magazines
      articles.map{|article|article.magazine}.uniq
    end
  
    def add_article(magazine, title)
      Article.new(self, magazine, title)
    end
  
    def topic_areas
      magazines.map{|magazine|magazine.category}.uniq
    end
  
end

  #Magazine class methods

class Magazine
    attr_accessor :name, :category
    @@all = []
    def initialize(name, category)
      @name = name
      @category = category
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def filtered_magazine_articles
      Article.all.filter{|article|article.magazine.name == self.name}
    end
  
    def contributors
      filtered_magazine_articles.map{|article|article.author}.uniq
    end
  
    def self.find_by_name(name)
      Magazine.all.find{|magazine|magazine.name == name }
    end
  
    def article_titles
      filtered_magazine_articles.map{|article|article.title}
    end
  
    def contributing_authors
      main_authors = []
      filtered_magazine_articles.map{|article|article.author}.tally.filter{|key,value|value>2 && (main_authors << key)}
      main_authors
    end
  
end

#Article class methods

class Article

    attr_reader :author, :magazine, :title
    @@all = []
    def initialize(author, magazine, title)
        @author = author
        @magazine =  magazine
        @title = title
        @@all << self
    end

    def self.all
        @@all
    end

    def author
        @author.name
    end

end

  
