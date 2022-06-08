require('rails_helper')

RSpec.describe :Post, type: :model do
  # tests go here
  subject { Comment.new(text: 'Test post', post_id: 5, author_id: 1) }

  before { subject.save }

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'text should not have more than 2000 charachters' do
    # expect(subject.title).to have_at_most(100).charachters
    subject.text = 'a' * 2001
    expect(subject).to_not be_valid
  end

  it 'post_id should be present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'author_id should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'author_id should be integer' do
    subject.author_id = 'hello'
    expect(subject).to_not be_valid
  end

  it 'post_id should be integer' do
    subject.post_id = 'hello'
    expect(subject).to_not be_valid
  end
end
