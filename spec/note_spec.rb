require 'note'

describe Note do
  note = Note.new('A', 'abc')

  it 'initialises with a title' do
    expect(note.title).to eq 'A'
  end

  it 'initialises with a body' do
    expect(note.body).to eq 'abc'
  end

  it 'Returns the length of the note' do
    expect(note.note_length).to eq 3
  end
end