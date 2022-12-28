require 'rails_helper'

RSpec.describe 'blog_posts/new', type: :view do
  before(:each) do
    assign(:blog_post, BlogPost.new(
                         title: 'MyString',
                         body: 'MyText',
                         url: 'MyString'
                       ))
  end

  it 'renders new blog_post form' do
    render

    assert_select 'form[action=?][method=?]', blog_posts_path, 'post' do
      assert_select 'input[name=?]', 'blog_post[title]'

      assert_select 'textarea[name=?]', 'blog_post[body]'

      assert_select 'input[name=?]', 'blog_post[url]'
    end
  end
end
