# -*- encoding: utf-8 -*-

module ModelsHelper

  def embedded_user_model
    {
      :id => "User",
      :properties => {
        :id => {
          :type => "long",
          :required => true
        },
        :first_name => {
          :type => "string"
        },
        :last_name => {
          :type => "string"
        },
        :avatar_url => {
          :type => "string",
          :required => true
        },
        :url => {
          :type => "string",
          :required => true
        }
      }
    }.to_json
  end

  def user_model
    {
      :id => "User",
      :properties => {
        :id => {
          :type => "long",
          :required => true
        },
        :first_name => {
          :type => "string"
        },
        :last_name => {
          :type => "string"
        },
        :avatar_url => {
          :type => "string",
          :required => true
        },
        :url => {
          :type => "string",
          :required => true
        },
        :gender => {
          :type => "string",
          :allowableValues => {
            :valueType => "LIST",
            :values => [
              "male",
              "female"
            ]
          }
        },
        :birthday => {
          :type => "Date"
        },
        :country => {
          :type => 'string'
        },
        :city => {
          :type => 'string'
        },
        :level => {
          :type => 'string',
          :required => true,
          :allowableValues => {
            :valueType => "LIST",
            :values => [
              "rookie",
              "bronze",
              "silver",
              "gold",
              "diamond",
              "pro"
            ]
          }
        },
        :training_logs_count => {
          :type => 'int',
          :required => true
        },
        :friends_count => {
          :type => 'int',
          :required => true
        },
        :medals_count => {
          :type => 'int',
          :required => true
        },
        :latest_activity => {
          :type => 'TrainingLog'
        },
        :training_goal => {
          :type => 'TrainingGoal'
        },
        :records_and_highlights => {
          :type => 'text'
        },
        :my_sports => {
          :type => 'text'
        },
        :friends_url => {
          :type => "string",
          :required => true
        },
        :sports_url => {
          :type => "string",
          :required => true
        }
      }
    }.to_json
  end


  def sport_param_model
    {
      :id => "SportParam",
      :properties => {
        :id => {
          :type => "string",
          :required => true
        },
        :name => {
          :type => "string",
          :required => true
        },
        :unit => {
          :type => "string",
          :required => true
        },
        :type => {
          :allowableValues => {
            :valueType => "LIST",
            :values => [
              "int",
              "float",
              "string"
            ]
          },
          :type => "string",
          :required => true
        },
        :value => {
          :type => "int,float,string",
          :required => true
        }
      }
    }.to_json
  end

  def cheer_model
    {
      :id => "Cheer",
      :properties => {
        :id => {
          :type => "long",
          :required =>  true
        },
        :user => {
          :type => "User",
          :required =>  true
        },
        :icon_url => {
          :type => "string",
          :required =>  true
        }
      }
    }.to_json
  end

end
