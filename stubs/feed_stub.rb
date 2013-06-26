class FeedStub

  def self.feeds(options = {})
    [
      {
        :id  => 12345,
        :kind => 'single',
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
             :kind => 'PlainText',
             :name => 'Walking 2 km, 24.06.2013',
             :url  => ''
           }
        ]
      }
    ]
  end

end
