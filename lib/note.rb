class Note
  attr_reader :title, :body

  def initialize(title, body)
    @title = title
    @body = body
  end

  def note_length
    @body.chars.count
  end
end