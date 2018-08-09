require './notes_app.rb'

describe Notebook do
  it { is_expected.to respond_to :title }

  it { is_expected.to respond_to :body }

  it { is_expected.to respond_to :titles }

  it { is_expected.to respond_to(:add_note).with(2).arguments }

  it { is_expected.to respond_to(:search).with(1).argument }

  it { is_expected.to respond_to(:all_titles) }

  it { is_expected.to respond_to(:delete_title) }

  it { is_expected.to respond_to(:no_of_titles) }

  it 'Adds a note to titles when #add_note is called' do
    subject.add_note('A', 'abc')
    expect(subject.titles).to eq('A' => 'abc')
  end

  it 'Returns all titles when #titles is called ' do
    allow(subject).to receive(:titles).and_return(%w[A B C D])
    expect(subject.titles).to eq %w[A B C D]
  end

  it 'Returns a note when #search is called' do
    subject.add_note('A', 'abc')
    subject.add_note('B', 'def')
    subject.add_note('C', 'ghi')
    expect(subject.search('B') == {'B' => 'def'}).to eq true
  end

  it 'Returns \'Not in titles.\' if an invalid title is searched for' do
    subject.add_note('A', 'abc')
    subject.add_note('B', 'def')
    subject.add_note('C', 'ghi')
    expect(subject.search('D')).to eq('Not in titles.')
  end

  it 'Returns an array of all titles when #all_titles is called' do
    subject.add_note('A', 'abc')
    subject.add_note('B', 'def')
    subject.add_note('C', 'ghi')
    expect(subject.all_titles).to eq(%w[A B C])
  end

  it 'Deletes a title & it\'s associated text when #delete_title is called' do
    subject.add_note('A', 'abc')
    subject.add_note('B', 'def')
    subject.add_note('C', 'ghi')
    subject.delete_title('B')
    expect(subject.titles).to eq('A' => 'abc', 'C' => 'ghi')
  end

  it 'Returns \'Not in titles.\' when trying to delete invalid title' do
    subject.add_note('A', 'abc')
    subject.add_note('B', 'def')
    subject.add_note('C', 'ghi')
    expect(subject.delete_title('D')).to eq('Not in titles.')
  end

  it 'Returns the number of titles when #no_of_titles is called' do
    subject.add_note('A', 'abc')
    subject.add_note('B', 'def')
    subject.add_note('C', 'ghi')
    expect(subject.no_of_titles).to eq 3
  end
end