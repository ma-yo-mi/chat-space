class Group < ApplicationRecord
has_many: messages
has_many: users, through: :group_members
has_many: groups_users
validates :name, presence: true, uniqueness: true
end
