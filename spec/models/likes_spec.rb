require('rails_helper')

RSpec.describe :Like, type: :model do
  # tests go here
  subject { Like.new(post_id: 5, author_id: 1) }

  before { subject.save }

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
