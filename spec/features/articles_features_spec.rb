require 'rails_helper'

RSpec.feature "ArticlesFeatures", type: :feature do
  scenario "go to /articles without logged will redirect to /login" do
    visit '/articles'

    expect(current_path).to eq('/login')
  end

  scenario "go to /articles/new without logged will redirect to /login" do
    visit '/articles/new'

    expect(current_path).to eq('/login')
  end

  scenario "go to /articles/show without logged will redirect to /login" do
    article = Article.create!(title: 'test', content: 'test')

    visit article_path(article.id)

    expect(current_path).to eq('/login')
  end

end
