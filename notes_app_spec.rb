require './notes_app.rb'

describe Notebook do
  let(:note1) { double :note, title: 'A', body: 'abc' }
  let(:note2) { double :note, title: 'B', body: 'def' }
  let(:note3) { double :note, title: 'C', body: 'ghi' }

  it 'Adds a note to titles when #add_note is called' do
    subject.add_note(note1)
    expect(subject.titles).to eq('A' => 'abc')
  end

  it 'Returns \'Title already exists.\' if trying to add existing title.' do
    subject.add_note(note1)
    expect(subject.add_note(note1)).to eq('Title already exists.')
  end

  it 'Returns all titles when #titles is called ' do
    allow(subject).to receive(:titles).and_return(%w[A B C D])
    expect(subject.titles).to eq %w[A B C D]
  end

  it 'Returns a note when #search is called' do
    subject.add_note(note1)
    subject.add_note(note2)
    subject.add_note(note3)
    expect(subject.search('B') == {'B' => 'def'}).to eq true
  end

  it 'Returns \'Not in titles.\' if an invalid title is searched for' do
    subject.add_note(note1)
    subject.add_note(note2)
    subject.add_note(note3)
    expect(subject.search('D')).to eq('Not in titles.')
  end

  it 'Returns an array of all titles when #all_titles is called' do
    subject.add_note(note1)
    subject.add_note(note2)
    subject.add_note(note3)
    expect(subject.all_titles).to eq(%w[A B C])
  end

  it 'Deletes a title & it\'s associated text when #delete_title is called' do
    subject.add_note(note1)
    subject.add_note(note2)
    subject.add_note(note3)
    subject.delete_title('B')
    expect(subject.titles).to eq('A' => 'abc', 'C' => 'ghi')
  end

  it 'Returns \'Not in titles.\' when trying to delete invalid title' do
    subject.add_note(note1)
    subject.add_note(note2)
    subject.add_note(note3)
    expect(subject.delete_title('D')).to eq('Not in titles.')
  end

  it 'Returns the number of titles when #no_of_titles is called' do
    subject.add_note(note1)
    subject.add_note(note2)
    subject.add_note(note3)
    expect(subject.no_of_titles).to eq 3
  end
end

describe Note do
  note = Note.new('A', 'abc')

  it 'Responds to #title' do
    expect(note.title).to eq 'A'
  end

  it 'Responds to #body' do
    expect(note.body).to eq 'abc'
  end
end