require 'notes_app'

describe Notebook do
  let(:note1) { double :note, title: 'A', body: 'abc' }
  let(:note2) { double :note, title: 'B', body: 'def' }
  let(:note3) { double :note, title: 'C', body: 'ghi' }

  describe '#add_note' do
    it 'adds a note' do
      subject.add_note(note1)
      expect(subject.titles).to eq('A' => 'abc')
    end

    it 'Returns \'Title already exists.\' if trying to add existing title.' do
      subject.add_note(note1)
      expect { subject.add_note(note1) }.to raise_error('Title already exists.')
    end
  end

  describe '#titles' do
    it 'returns the titles' do
      allow(subject).to receive(:titles).and_return(%w[A B C D])
      expect(subject.titles).to eq %w[A B C D]
    end
  end

  context 'When the notebook is populated.' do
    before(:each) do
      subject.add_note(note1)
      subject.add_note(note2)
      subject.add_note(note3)
    end

    describe '#search' do
      it 'Returns a note' do
        expect(subject.search('B') == {'B' => 'def'}).to eq true
      end
    
      it 'Returns \'Not in titles.\' if an invalid title is searched for' do
        expect { subject.search('D') }.to raise_error('Not in titles.')
      end
    end

    describe '#all_titles' do
      it 'Returns an array of all titles' do
        expect(subject.all_titles).to eq(%w[A B C])
      end
    end

    describe '#title' do
      it 'Deletes a title & it\'s associated text' do
        subject.delete_title('B')
        expect(subject.titles).to eq('A' => 'abc', 'C' => 'ghi')
      end
    
      it 'Returns \'Not in titles.\' when trying to delete invalid title' do
        expect { subject.delete_title('D') }.to raise_error('Not in titles.')
      end
    end

    describe '#no_of_titles' do          
      it 'Returns the number of titles when #no_of_titles is called' do
        expect(subject.no_of_titles).to eq 3
      end
    end
  end
end