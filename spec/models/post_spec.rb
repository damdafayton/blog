require('rails_helper')

RSpec.describe :Post, type: :model do
  # tests go here
  subject { Post.new(title: 'Test post', text: 'Test text', author_id: 1) }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'author_id should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'author_id should be integer' do
    subject.author_id = 'hello'
    # expect(subject.author_id).to be_an(Integer)
    expect(subject).to_not be_valid
  end

  it 'title should not have more than 100 charachters' do
    # expect(subject.title).to have_at_most(100).charachters
    subject.title = 'a' * 101
    expect(subject).to_not be_valid
  end

  it 'text should not have more than 5000 charachters' do
    # expect(subject.title).to have_at_most(100).charachters
    subject.title = 'a' * 5001
    expect(subject).to_not be_valid
  end
end
