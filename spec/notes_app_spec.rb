require 'notes_app'

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
    expect { subject.add_note(note1) }.to raise_error('Title already exists.')
  end

  it 'Returns all titles when #titles is called ' do
    allow(subject).to receive(:titles).and_return(%w[A B C D])
    expect(subject.titles).to eq %w[A B C D]
  end

  context 'When the notebook is populated.' do
    before(:each) do
      subject.add_note(note1)
      subject.add_note(note2)
      subject.add_note(note3)
    end

    it 'Returns a note when #search is called' do
      expect(subject.search('B') == {'B' => 'def'}).to eq true
    end
  
    it 'Returns \'Not in titles.\' if an invalid title is searched for' do
      expect { subject.search('D') }.to raise_error('Not in titles.')
    end
  
    it 'Returns an array of all titles when #all_titles is called' do
      expect(subject.all_titles).to eq(%w[A B C])
    end
  
    it 'Deletes a title & it\'s associated text when #delete_title is called' do
      subject.delete_title('B')
      expect(subject.titles).to eq('A' => 'abc', 'C' => 'ghi')
    end
  
    it 'Returns \'Not in titles.\' when trying to delete invalid title' do
      expect { subject.delete_title('D') }.to raise_error('Not in titles.')
    end
  
    it 'Returns the number of titles when #no_of_titles is called' do
      expect(subject.no_of_titles).to eq 3
    end
  end
end

describe Note do
  note = Note.new('A', 'abc')

  it 'Returns the length of the note' do
    expect(note.note_length).to eq 3
  end
end