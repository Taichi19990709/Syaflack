class Post < ApplicationRecord
    belongs_to :user
    validates :datetime, presence: true
    validates :task, presence: true
    validates :importanceoftask, presence: true



end
