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
