# Данная модель к примеру использует миграцию "CreateArticles" из директории "db/migrate"
class Article < ApplicationRecord
  # Declares that a "title" value must be present.
  validates :title, presence: true
  # The "body" value must be present and be at least 10 characters
  validates :body, presence: true, length: {minimum: 10}
end
