# -*- encoding: utf-8 -*-

module ModelsHelper

  def comment_model
    {
      :id => "Comment",
      :properties => {
        :id => {
          :type => "long",
          :required => true
        },
        :user => {
          :type => "User",
          :required =>  true
        },
        :notes => {
          :type => "text",
          :required =>  true
        },
        :url => {
          :type => "string",
          :required =>  true
        },
        :avatar_url => {
          :type => "string",
          :required => true
        },
        :removable => {
          :type => "boolean",
          :required => true
        }
      }
    }.to_json
  end

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
        :url => {
          :type => "string",
          :required => true
        },
        :created_at => {
          :type => "DateTime",
          :required => true
        },
        :avatar_url => {
          :type => "string",
          :required => true
        },
        :locale => {
          :type => "string",
          :required => true
        },
        :measurement_units => {
          :type => "string",
          :required => true,
          :allowableValues => {
            :valueType => "LIST",
            :values => [
              "metric",
              "imperial"
            ]
          }
        },
        :birthday => {
          :type => "Date"
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
        :my_sports => {
          :type => 'text'
        },
        :records_and_highlights => {
          :type => 'text'
        },
        :training_logs_count => {
          :type => 'int',
          :required => true
        },
        :training_logs_url => {
          :type => "string",
          :required => true
        },
        :medals_count => {
          :type => 'int',
          :required => true
        },
        :medals_url => {
          :type => "string",
          :required => true
        },
        :friends_count => {
          :type => 'int',
          :required => true
        },
        :friends_url => {
          :type => "string",
          :required => true
        },
        :top_sports_url => {
          :type => "string",
          :required => true
        },
        :latest_activity => {
          :type => 'TrainingLog'
        },
        :training_goal => {
          :type => 'TrainingGoal'
        },
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
