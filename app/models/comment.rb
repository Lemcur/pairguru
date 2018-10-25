class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates_uniqueness_of :user, scope: :movie
  validates_presence_of :content
end