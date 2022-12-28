require 'rails_helper'

RSpec.describe 'blog_posts/edit', type: :view do
  before(:each) do
    @blog_post = assign(:blog_post, BlogPost.create!(
                                      title: 'MyString',
                                      body: 'MyText',
                                      url: 'MyString'
                                    ))
  end

  it 'renders the edit blog_post form' do
    render

    assert_select 'form[action=?][method=?]', blog_post_path(@blog_post), 'post' do
      assert_select 'input[name=?]', 'blog_post[title]'

      assert_select 'textarea[name=?]', 'blog_post[body]'

      assert_select 'input[name=?]', 'blog_post[url]'
    end
  end
end
