User.delete_all
Article.delete_all
Comment.delete_all

User.create!(name: 'ken', password: '12345678', email: 'ken@mail.vn')
article = Article.create!(title: 'test', content: 'test')
Comment.create!(name: 'ken', content: 'test comment 1', article_id: article.id)
Comment.create!(name: 'hatu', content: 'test comment 2', article_id: article.id)

Article.create!(title: 'test2', content: 'test2')
