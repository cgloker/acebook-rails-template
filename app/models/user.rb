class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy

  has_many :friend_requests_as_requestor,
    foreign_key: :requestor_id,
    class_name: :FriendRequest

  has_many :friend_requests_as_receiver,
    foreign_key: :receiver_id,
    class_name: :FriendRequest

  has_many :friendships_as_friend_a
    foreign_key: :friend_a_id,
    class_name: :Friendship

  has_many :friendships_as_friend_b
    foreign_key: :friend_b_id,
    class_name: :Friendship

  has_many :friend_as, through: :friendships_as_friend_b
  has_many :friend_bs, through: :friendships_as_friend_a

  def friendships
    self.friendships_as_friend_a + self.friendships_as_friend_b
  end

end
