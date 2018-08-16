require_relative 'note'

class Notebook
  attr_reader :titles

  def initialize
    @titles = {}
  end

  def add_note(new_note)
    raise('Title already exists.') unless @titles[new_note.title].nil?
    @titles[new_note.title] = new_note.body
  end

  def search(title)
    raise 'Not in titles.' if @titles[title].nil?
    @titles.select { |k, v| k == title }
  end

  def all_titles
    all_titles = []
    @titles.each_key { |k| all_titles << k }
    all_titles
  end

  def delete_title(title)
    raise('Not in titles.') if @titles[title].nil?
    @titles.delete(title)
  end

  def no_of_titles
    @titles.keys.count
  end
end