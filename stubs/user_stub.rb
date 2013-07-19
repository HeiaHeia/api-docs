# -*- encoding : utf-8 -*-

require 'base_stub'
require 'training_goal_stub'

class UserStub
  include BaseStub

  KIND = 'User'
  MALE = '?'
  FEMALE = '?'

  def self.entries
    [
      {
        :id => 1,
        :first_name => 'Alexander',
        :last_name => 'Stubb',
        :updated_at => Time.new(2012, 6, 26, 17, 1, 18).utc,
        :created_at => Time.new(2012, 6, 26, 17, 1, 18).utc
      },
      {
        :id => 2,
        :first_name => 'Homer',
        :last_name => 'Simpson',
        :updated_at => Time.new(2012, 7, 27, 17, 1, 18).utc,
        :created_at => Time.new(2012, 7, 26, 17, 1, 18).utc
      },
      {
        :id => 3,
        :first_name => 'Bender',
        :last_name => 'Bending Rodríguez',
        :updated_at => Time.new(2013, 6, 26, 17, 1, 18).utc,
        :created_at => Time.new(2013, 6, 16, 17, 1, 18).utc
      }
    ]
  end

  def to_hash
    @attributes.slice(:id, :first_name, :last_name).merge({
      :url => url,
      :created_at => created_at,
      :avatar_url => avatar_url,
      :locale => 'fi',
      :measurement_units => 'metric',
      :birthdate => Date.new(1980, 1, 1),
      :gender => 'female',
      :country => 'Finland',
      :city => 'Helsinki',
      :level => 'Bronze',
      :my_sports => 'Running and cycling.',
      :records_and_highlights => 'My records text.',
      :training_logs_count => 100,
      :training_logs_url => training_logs_url,
      :medals_count => 1,
      :medals_url => medals_url,
      :friends_count => 8,
      :friends_url => friends_url,
      :top_sports_url => top_sports_url,
      :latest_activity => {
        :id => 1,
        :updated_at => Time.new(2013, 6, 26, 17, 1, 18).utc,
        :created_at => Time.new(2013, 6, 16, 17, 1, 18).utc
      },
      :training_goal => TrainingGoalStub.find(1).to_hash,
      :friendship_status => friendship_status,
      :friendship_url => friendship_url
    })
  end


  def full_name
    "#{@attributes[:first_name]} #{@attributes[:last_name]}".strip
  end

  def url
    "https://api.heiaheia.com/v2/users/#{id}"
  end

  def to_entity
    {
      :kind => KIND,
      :name => full_name,
      :url => url
    }
  end

  def to_embedded
    {
      :id => id,
      :first_name => @attributes[:first_name],
      :last_name => @attributes[:last_name],
      :url => url,
      :avatar_url => avatar_url
    }
  end

  def avatar_url
    "#{url}/avatar.png"
  end

  def top_sports_url
    "#{url}/top_sports"
  end

  def medals_url
    "#{url}/medals"
  end

  def training_logs_url
    "#{url}/training_logs"
  end

  def friends_url
    "#{url}/friends"
  end

  def friendship_status
    'not_friend'
  end

  def friendship_url
    "https://api.heiaheia.com/v2/friends/#{id}"
  end

end
