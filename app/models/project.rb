class Project < ActiveRecord::Base
  validates :title, presence: { message: "must have a title"}, uniqueness: true
  validates :description, presence: { message: "must have a description" }, uniqueness: true

  scope :lastest_ten, ->(x) { order("created_at DESC").limit(10) }
  default_scope { order("created_at DESC") }

  before_save :capitalize_title

  private

  def capitalize_title
    self.title.capitalize!
  end

end
