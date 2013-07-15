# -*- encoding : utf-8 -*-

require 'base_stub'
require 'user_stub'

class TrainingGoalStub
  include BaseStub

  KIND = 'TrainingGoal'

  def self.entries
    [
      {
        :id  => 1,
        :title => 'I’m gonna go build my own theme park, with blackjack and hookers!',
        :private => true,
        :cheers_count => 3,
        :cheerable => false,
        :comments_count => 0,
        :commentable => true,
        :updated_at => Time.new(2013, 06, 26, 17, 1, 18),
        :created_at => Time.new(2013, 06, 26, 17, 1, 18)
      }
    ]
  end

  def to_hash
    {
      :kind => KIND,
      :icon_url => 'http://heiaheia.com/images/icons/training_goal.png',
      :url => url,
      :cheers_url => cheers_url,
      :comments_url => comments_url,
      :updated_at => updated_at,
      :created_at => created_at,
      :user => UserStub.find(1).to_embedded,
    }.merge(@attributes.slice(:id, :title, :private,
                              :cheers_count, :cheerable, :comments_count,
                              :commentable))
  end

  def to_entity
    {
      :kind => KIND,
      :name => @attributes[:title],
      :url => url
    }
  end


  def url
    "https://api.heiaheia.com/v2/training_goals/#{id}"
  end

  def comments_url
    "#{url}/comments"
  end

  def cheers_url
    "#{url}/cheers"
  end

end
