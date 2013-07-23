# -*- encoding : utf-8 -*-

require 'ext/hash'
require 'base_stub'
require 'user_stub'
require 'training_goal_stub'
require 'const'

class FeedStub
  include BaseStub

  TEXT_ENTRY = 'TextEntry'

  def self.entries
    [
      {
        :id => 1,
        :kind => TrainingGoalStub::KIND,
        :entry => TrainingGoalStub.find(1).to_hash,
        :created_at => Time.new(2013, 06, 26, 17, 1, 18),
      },
      {
        :id => 2,
        :kind => TEXT_ENTRY,
        :entry => {
          :description => "{{User:1}} commented on {{User:2}}'s entry ({{TrainingLog:310}}) and {{User:3}}'s training goal ({{TrainingGoal:1}})",
          :dict => {
            "User:1" => UserStub.find(1).to_entity,
            "User:2" => UserStub.find(2).to_entity,
            "TrainingLog:310" => {
              :kind => 'TrainingLog',
              :name => 'Running 4.5 km in 30 min, 24.06.2013',
              :url => "#{Const::BASE_PATH}/training_logs/310"
            },
            "User:3" => UserStub.find(3).to_entity,
            "TrainingGoal:1" => TrainingGoalStub.find(1).to_entity
          }
        },
        :created_at => Time.new(2013, 06, 25, 17, 4, 5),
      }
    ]
  end

  def to_hash
    {
      :id => id,
      :url => url,
      :created_at => created_at
    }.merge(@attributes.slice(:kind, :entry))
  end

  def url
    "#{Const::BASE_PATH}/feeds/#{id}"
  end

end
