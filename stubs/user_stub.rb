require 'base_stub'

class UserStub
  include BaseStub

  KIND = 'User'

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

  def full_name
    "#{@attributes[:first_name]} #{@attributes[:last_name]}"
  end

  def url
    "https://api.heiaheia.com/v2/users/#{id}"
  end

  def to_entity
    {
      :id => id,
      :kind => KIND,
      :name => full_name,
      :url => url
    }
  end

end
