require './notes_app.rb'

describe Notebook do
  it { is_expected.to respond_to :title }

  it { is_expected.to respond_to :body }

  it { is_expected.to respond_to :titles }

  it { is_expected.to respond_to(:add_note).with(2).arguments }

  it { is_expected.to respond_to(:search).with(1).argument }

  it 'Adds a note to titles when #add_note is called' do
    expect(subject.add_note('A', 'abc')).to eq [{'A' => 'abc'}]
  end

  it 'Returns all titles when #titles is called ' do
    allow(subject).to receive(:titles).and_return(%w[A B C D])
    expect(subject.titles).to eq %w[A B C D]
  end

  it 'Returns a note when #search is called' do
    subject.add_note('A', 'abc')
    expect(subject.search('A') == [{'A' => 'abc'}]).to eq true
  end
end