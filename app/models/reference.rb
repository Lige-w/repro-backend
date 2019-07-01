class Reference < ApplicationRecord
  belongs_to :project
  has_many :reference_authors
  has_many :authors, through: :reference_authors
  has_many :reference_tags
  has_many :tags, through: :reference_tags
  accepts_nested_attributes_for :authors
  accepts_nested_attributes_for :tags

  # validates :title, presence: true

  def authors_attributes=(author_attributes)
    author_attributes.each do |author_attribute|
      author = Author.find_or_create_by(author_attribute)
      self.authors << author
    end
  end

  def tags_attributes=(tag_attributes)
    tag_attributes.each do |tag_attribute|
      tag = Tag.find_or_create_by(tag_attribute)
      self.tags << tag
    end
  end
end
