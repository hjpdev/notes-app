require './notes_app.rb'

describe Notebook do
  it { is_expected.to respond_to :title }

  it { is_expected.to respond_to :body }

  it { is_expected.to respond_to :titles }

  it { is_expected.to respond_to(:add_note).with(2).arguments }

  it 'Adds a note to titles when #add_note is called' do
    allow(subject).to receive(:add_note).and_return('A', 'abc')
    expect(subject.titles['A'] == 'abc').to eq true
  end

  it 'Returns all titles when #titles is called ' do
    allow(subject).to receive(:titles).and_return(%w[A B C D])
    expect(subject.titles).to eq %w[A B C D]
  end
end