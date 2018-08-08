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
end

