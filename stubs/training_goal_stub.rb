# -*- encoding : utf-8 -*-

require 'ext/hash'
require 'base_stub'
require 'user_stub'
require 'const'

class TrainingGoalStub
  include BaseStub

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
        :created_at => Time.new(2013, 06, 26, 17, 1, 18),
        :user_id => 3
      }
    ]
  end

  def to_hash
    @attributes.slice(:id, :title, :private, :cheers_count, :cheerable,
                      :comments_count, :commentable).merge({
      :kind => Const::TRAINING_GOAL,
      :icon_url => 'https://example.com/images/icons/training_goal.png',
      :url => url,
      :cheers_url => cheers_url,
      :comments_url => comments_url,
      :created_at => created_at,
      :user => UserStub.find(@attributes[:user_id]).to_compact_hash,
    })
  end

  def to_entity
    {
      :kind => Const::TRAINING_GOAL,
      :name => @attributes[:title],
      :url => url
    }
  end


  def url
    "#{Const::BASE_PATH}/training_goals/#{id}"
  end

  def comments_url
    "#{url}/comments"
  end

  def cheers_url
    "#{url}/cheers"
  end

end
