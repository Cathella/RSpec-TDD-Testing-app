require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.first_or_create!(email: 'cat@email.com', password: 'password', password_confirmation: 'password')

  it 'has a title' do
    post = Post.new(
      title: '',
      body: 'A valid body',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid

    post.title = 'A valid title'
    expect(post).to be_valid
  end

  it 'has a body' do
    post = Post.new(
      title: 'A valid title',
      body: '',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid

    post.body = 'A valid body'
    expect(post).to be_valid
  end

  it 'has a title atleast 4 characters long' do
    post = Post.new(
      title: '',
      body: 'A valid body',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid

    post.title = '1234'
    expect(post).to be_valid
  end

  it 'has a body between 5 and 100 characters' do
    post = Post.new(
      title: 'A valid title',
      body: '',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid

    post.body = '12345'
    expect(post).to be_valid

    hundred_char_string = 'xOK3byodSvtVDZa6VNxlRmwyZGso5kA1rUhMKvHE6OxOMrFSfu17ifYMqg3UOSMcaf6N40R2gVEGNbgqNcXBngAXtsqUerlsaMrO'
    post.body = hundred_char_string
    expect(post).to be_valid

    post.body = hundred_char_string + '1'
    expect(post).not_to be_valid
  end

  it 'has numerical views' do
    post = Post.new(
      title: 'A valid title',
      body: 'A valid body',
      user: current_user,
      views: 0
    )
    expect(post.views).to be_a(Integer)
  end
end
