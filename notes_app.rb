class Notebook
  attr_reader :title, :body, :titles

  def initialize
    @titles = []
  end

  def add_note(title, body)
    note = {}
    note[title] = body
    @titles << note
  end

  def search(title)
    @titles.each { |k, v| k == title ? @titles[k, v] : nil }
  end
end

nb = Notebook.new
nb.add_note('A', 'abc')
p nb.search('A')  

