class FeedStub
  FEEDS =     [
    {
      :id  => 12345,
      :kind => 'FeedEntry',
      :url => 'https://api.heiaheia.com/v2/feeds/12345',
      :icon_url => 'http://heiaheia.com/images/icons/training_log.png',
      :title => 'Great ride!',
      :description => 'It was awesome day.',
      :private => true,
      :cheers_count => 3,
      :cheers_url => 'https://api.heiaheia.com/v2/training_logs/314/cheers',
      :cheerable => false,
      :comments_count => 0,
      :comments_url => 'https://api.heiaheia.com/v2/training_logs/314/comments',
      :commentable => true,
      :updated_at => '2013-06-26T17:01:18+03:00',
      :created_at => '2013-06-26T17:01:18+03:00',
      :dict => {},
      :properties => [
        {
          :kind => 'User',
          :name => 'Alexander Stubb',
          :url  => 'https://api.heiaheia.com/v2/users/1'
        },
        {
          :kind => 'TrainingLog',
          :name => 'Walking 2 km, 24.06.2013',
          :url  => 'https://api.heiaheia.com/v2/training_logs/314'
        }
      ]
    },
    {
      :id  => 1234,
      :kind => 'AggregatedFeedEntry',
      :url => 'https://api.heiaheia.com/v2/feeds/1234',
      :icon_url => nil,
      :title => nil,
      :description => "{{User:1}} commented on {{User:2}}'s entry ({{TrainingLog:310}}) and {{User:3}}'s training goal ({{TrainingGoal:1}})",
      :private => false,
      :cheers_count => 0,
      :cheers_url => nil,
      :cheerable => false,
      :comments_count => 0,
      :comments_url => nil,
      :commentable => false,
      :updated_at => '2013-06-25T17:04:05+33:00',
      :created_at => '2013-06-25T17:04:05+33:00',
      :dict => {
        "User:1" => {
          :kind => 'User',
          :name => 'Alexander Stubb',
          :url  => 'https://api.heiaheia.com/v2/users/1'
        },
        "User:2" => {
          :kind => 'User',
          :name => 'Homer Simpson',
          :url  => 'https://api.heiaheia.com/v2/users/2'
        },
        "TrainingLog:310" => {
          :kind => 'TrainingLog',
          :name => 'Running 4.5 km in 30 min, 24.06.2013',
          :url  => 'https://api.heiaheia.com/v2/training_logs/310'
        },
        "User:3" => {
          :kind => 'User',
          :name => 'Bender Bending Rodríguez',
          :url  => 'https://api.heiaheia.com/v2/users/3'
        },
        "TrainingGoal:1" => {
          :kind => 'TrainingGoal',
          :name => 'I’m gonna go build my own theme park, with blackjack and hookers!',
          :url  => 'https://api.heiaheia.com/v2/training_goals/1'
        }
      },
      :properties => []
    }
  ]

  class << self
    def feeds
      FEEDS
    end

    def feed(entry_id)
      FEEDS.detect { |f| f[:id] == entry_id.to_i }
    end
  end

end
