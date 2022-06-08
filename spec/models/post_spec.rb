require('rails_helper')

RSpec.describe :Post, type: :model do
  #tests go here
  subject {Post.new(title: "Test post", text: "Test text", author_id: 1)}

  before {subject.save}

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
    expect(subject.author_id).to be_an(Integer)
  end
end