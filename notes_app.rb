class Notebook
  attr_reader :title, :body, :titles

  def initialize
    @titles = {}
  end

  def add_note(title, body)
    @titles[title] = body
  end

  def search(title)
    return 'Not in titles.' if @titles[title] == nil
    output = @titles.select { |k, v| k == title }
  end
end

nb = Notebook.new
nb.add_note('A', 'abc')
nb.add_note('B', 'abc')
nb.add_note('C', 'abc')
p nb.search('B')
p nb.search('d')

