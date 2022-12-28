require 'rails_helper'

RSpec.describe 'blog_posts/show', type: :view do
  before(:each) do
    @blog_post = assign(:blog_post, BlogPost.create!(
                                      title: 'Title',
                                      body: 'MyText',
                                      url: 'Url'
                                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Url/)
  end
end
