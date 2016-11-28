class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  has_many :comments

  def self.search(keyword)
    where('title like ?', "%#{keyword}")
  end

  def self.recents
    order(created_at: :desc)
  end

  def self.title_order
    order(:title)
  end

  def self.ordering(mode)
    if mode == "0"
      title_order
    else
      recents
    end
  end
end
