class Notebook
  attr_reader :title, :body, :titles

  def initialize
    @titles = {}
  end

  def add_note(title, body)
    @titles[title] = body
  end

  def search(title)
    return 'Not in titles.' if @titles[title].nil?
    @titles.select { |k, v| k == title }
  end

  def all_titles
    all_titles = []
    @titles.each_key { |k| all_titles << k }
    all_titles
  end

  def delete_title(title)
    return 'Not in titles.' if @titles[title].nil?
    @titles.delete(title)
  end
end



