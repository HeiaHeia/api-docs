# -*- encoding : utf-8 -*-

require 'base_stub'
require 'user_stub'

class FeedStub
  include BaseStub

  AGGREGATED_FEED_ENTRY = 'AggregatedFeedEntry'
  FEED_ENTRY = 'FeedEntry'

  def self.entries
    [
      {
        :id  => 12345,
        :kind => FEED_ENTRY,
        :icon_url => 'http://heiaheia.com/images/icons/training_log.png',
        :title => 'Great ride!',
        :description => 'It was awesome day.',
        :private => true,
        :cheers_count => 3,
        :cheerable => false,
        :comments_count => 0,
        :commentable => true,
        :updated_at => Time.new(2013, 06, 26, 17, 1, 18),
        :created_at => Time.new(2013, 06, 26, 17, 1, 18),
        :dict => {},
        :properties => [
          UserStub.find(1).to_entity,
          {
            :kind => 'TrainingLog',
            :name => 'Walking 2 km, 24.06.2013',
            :url  => 'https://api.heiaheia.com/v2/training_logs/314'
          },
          {
            :kind => 'PlainText',
            :name => 'Private',
            :url => ''
          }
        ]
      },
      {
        :id  => 1234,
        :kind => AGGREGATED_FEED_ENTRY,
        :icon_url => nil,
        :title => nil,
        :description => "{{User:1}} commented on {{User:2}}'s entry ({{TrainingLog:310}}) and {{User:3}}'s training goal ({{TrainingGoal:1}})",
        :private => false,
        :cheers_count => 0,
        :cheerable => false,
        :comments_count => 0,
        :commentable => false,
        :updated_at => Time.new(2013, 06, 25, 17, 4, 5),
        :created_at => Time.new(2013, 06, 25, 17, 4, 5),
        :dict => {
          "User:1" => UserStub.find(1).to_entity,
          "User:2" => UserStub.find(2).to_entity,
          "TrainingLog:310" => {
            :kind => 'TrainingLog',
            :name => 'Running 4.5 km in 30 min, 24.06.2013',
            :url  => 'https://api.heiaheia.com/v2/training_logs/310'
          },
          "User:3" => UserStub.find(3).to_entity,
          "TrainingGoal:1" => {
            :kind => 'TrainingGoal',
            :name => 'I’m gonna go build my own theme park, with blackjack and hookers!',
            :url  => 'https://api.heiaheia.com/v2/training_goals/1'
          }
        },
        :properties => []
      }
    ]
  end

  def to_hash
    {
      :id  => id,
      :url => url,
      :cheers_url => cheers_url,
      :comments_url => comments_url,
      :updated_at => updated_at,
      :created_at => created_at
    }.merge(@attributes.slice(:kind, :icon_url, :title, :description, :private,
                              :cheers_count, :cheerable, :comments_count,
                              :commentable, :dict, :properties))
  end

  def url
    "https://api.heiaheia.com/v2/feeds/#{id}"
  end

  def aggregated?
    @attributes[:kind] == AGGREGATED_FEED_ENTRY
  end

  def comments_url
    aggregated? ? nil : "#{url}/comments"
  end

  def cheers_url
    aggregated? ? nil : "#{url}/cheers"
  end

end
