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
