class Project < ActiveRecord::Base
  validates :title, presence: { message: "must have a title"}, uniqueness: true
  validates :description, presence: { message: "must have a description" }, uniqueness: true

  scope :lastest_ten, ->(x) { order("created_at DESC").limit(10) }
  default_scope { order("created_at DESC") }

  before_save :capitalize_title

  def self.search_by(term)
    where(["LOWER(title)          LIKE :search_term OR 
            LOWER(description)   LIKE :search_term", 
            {search_term: "%#{term.downcase}%"}]
          )
  end

  private

  def capitalize_title
    self.title.capitalize!
  end

end
