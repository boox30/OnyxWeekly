class Team
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :member_id, type: Array, :default => []
  field :team_leader, type: String

  def team_member?(user)
    return false if user.blank?
    self.member_id.include?(user.id)
  end

  def add_member(user)
    self.push(member_id: user.id)
    self.touch
  end

  def remove_member(user)
    self.pull(member_id: user.id)
    self.touch
  end
end
