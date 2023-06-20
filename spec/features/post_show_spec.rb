RSpec.describe 'pooost index', type: :feature do
  before :each do
    @user = User.create(
      name: 'mike',
      photo: 'https://www.shutterstock.com/image-vector/hi-hello-banner-speech-bubble-poster-1505210795',
      bio: 'kenyan Developer',
      postsCounter: 0
    )
    @usersalem = User.create(
      name: 'Salem',
      photo: 'https://www.shutterstock.com/image-vector/hi-hello-banner-speech-bubble-poster-1505210795',
      bio: 'American programmer',
      postsCounter: 0
    )
    @post = Post.create(author_id: @user.id, title: 'title', text: 'My first ost for mike', commentsCounter: 0,
                        likesCounter: 0)
    Comment.create(post_id: @post.id, author_id: @user.id, text: 'curious comment')
    Comment.create(post_id: @post.id, author_id: @usersalem.id, text: 'mike comment')
    visit user_posts_path(@user.id)
  end

  it 'username of the user' do
    expect(page).to have_content(@post.title)
  end

  it 'writer of the post' do
    expect(page).to have_content('mike')
  end

  it 'comments for post' do
    expect(page).to have_content('comments: 0')
  end

  it 'likes for post' do
    expect(page).to have_content('likes: 0')
  end

  it ' body of post' do
    expect(page).to have_content('My first ost for mike')
  end

  it 'username of commenter' do
    expect(page).to have_content('Salem')
  end

  it 'comment of commenter' do
    expect(page).to have_content('My first ost for mike')
  end
end
