# -*- encoding: utf-8 -*-

require 'set'
require 'ext/string'

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
          :type => "CompactUser",
          :required => true
        },
        :notes => {
          :type => "text",
          :required => true
        },
        :url => {
          :type => "string",
          :required => true
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

  def compact_user_model
    {
      :id => "CompactUser",
      :properties => {
        :id => {
          :type => "long",
          :required => true
        },
        :first_name => {
          :type => "string",
          :required => true
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
    }
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
          :type => "string",
          :required => true
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
        :friendship_status => {
          :type => "string",
          :description => "\"pending\" when you sent the friend request, \"requested\" when friend request was sent to you",
          :required => true,
          :allowableValues => {
            :valueType => "LIST",
            :values => [
              "not_friend",
              "friend",
              "requested",
              "pending"
            ]
          }

        },
        :friendship_url => {
          :type => "string",
          :required => true
        }
      }
    }
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
    }
  end

  def cheer_model
    {
      :id => "Cheer",
      :properties => {
        :id => {
          :type => "long",
          :required => true
        },
        :user => {
          :type => "CompactUser",
          :required => true
        },
        :cheer_type => {
          :type => "CheerType",
          :required => true
        },
        :created_at => {
          :type => "DateTime",
          :required => true
        }
      }
    }
  end

  def compact_sport_model
    {
      :id => "CompactSport",
      :properties => {
        :id => {
          :type => "long",
          :required => true
        },
        :name => {
          :type => "string",
          :required => true
        },
        :icon_url => {
          :type => "string",
          :required => true
        },
        :planned_icon_url => {
          :type => "string",
          :required => true
        },
        :url => {
          :type => "string",
          :required => true
        }
      }
    }
  end

  def sport_model
    {
      :id => "Sport",
      :properties => {
        :id => {
          :type => "long",
          :required => true
        },
        :name => {
          :type => "string",
          :required => true
        },
        :icon_url => {
          :type => "string",
          :required => true
        },
        :planned_icon_url => {
          :type => "string",
          :required => true
        },
        :url => {
          :type => "string",
          :required => true
        },
        :sport_params => {
          :items => {
            :$ref => "SportParam"
          },
          :type => "Array"
        },
        :exclude_stats => {
          :required => true,
          :type => "boolean"
        },
        :updated_at => {
          :type => "DateTime",
          :required => true
        },
        :created_at => {
          :type => "DateTime",
          :required => true
        }
      }
    }
  end

  def cheer_type_model
    {
      :id => "CheerType",
      :properties => {
        :id => {
          :type => "int",
          :required => true
        },
        :icon_url => {
          :type => "string",
          :required => true
        },
        :level => {
          :type => "byte",
          :required => true
        }
      }
    }
  end

  def place_model
    {
      :id => "Place",
      :properties => {
        :id => {
          :type => "int",
          :required => true
        },
        :name => {
          :type => "string",
          :required => true
        },
        :latitude => {
          :type => "double",
          :required => true
        },
        :longitude => {
          :type => "double",
          :required => true
        },
        :url => {
          :type => "string",
          :required => true
        }
      }
    }
  end

  def training_log_model
    {
      :id => "TrainingLog",
      :properties => {
        :id => {
          :type => "long",
          :required => true
        },
        :date => {
          :type => "Date",
          :required => true
        },
        :status => {
          :allowableValues => {
            :valueType => "LIST",
            :values => [
              "regular",
              "planned"
            ]
          },
          :description => "training log status",
          :type => "string",
          :required => true
        },
        :sport => {
          :type => "CompactSport",
          :required => true
        },
        :user => {
          :type => "CompactUser",
          :required => true
        },
        :notes => {
          :type => "text",
          :required => true
        },
        :title => {
          :type => "string"
        },
        :description => {
          :type => "text"
        },
        :mood => {
          :type => "byte",
          :required => true,
          :description => "A value from 0 to 5. Where 0 - no mood set, 1 - worst mood, 5 - best mood"
        },
        :mood_icon_url => {
          :type => "string",
          :required => true
        },
        :calories => {
          :type => "int"
        },
        :duration_h => {
          :type => "int"
        },
        :duration_m => {
          :type => "int"
        },
        :duration_s => {
          :type => "int"
        },
        :avg_hr => {
          :type => "int"
        },
        :max_hr => {
          :type => "int"
        },
        :sport_params => {
          :items => {
            :$ref => "SportParam"
          },
          :type => "Array"
        },
        :favourite => {
          :type => "boolean"
        },
        :private => {
          :type => "boolean"
        },
        :cheers_count => {
          :type => "int"
        },
        :comments_count => {
          :type => "int"
        },
        :distance => {
          :type => "int"
        },
        :steps => {
          :type => "int"
        },
        :exclude_stats => {
          :type => "boolean"
        },
        :cheerable => {
          :type => "boolean"
        },
        :commentable => {
          :type => "boolean"
        },
        :place => {
          :type => "Place"
        },
        :updated_at => {
          :type => "DateTime",
          :required => true
        },
        :created_at => {
          :type => "DateTime",
          :required => true
        },
        :gpx_url => {
          :type => "string"
        }
      }
    }
  end

  def weight_model
    {
      :id => "Weight",
      :properties => {
        :id => {
          :type => "long",
          :required => true
        },
        :date => {
          :type => "Date",
          :required => true
        },
        :user => {
          :type => "CompactUser",
          :required => true
        },
        :url => {
          :type => "string",
          :required => true
        },
        :icon_url => {
          :type => "string",
          :required => true
        },
        :notes => {
          :type => "text",
          :required => true
        },
        :title => {
          :type => "string"
        },
        :description => {
          :type => "text"
        },
        :value => {
          :type => "text",
          :required => true,
          :description => "In unit that set in the user settings (kg or lb)"
        },
        :private => {
          :type => "boolean"
        },
        :cheers_count => {
          :type => "int"
        },
        :cheers_url => {
          :type => "string"
        },
        :cheerable => {
          :type => "boolean",
          :required => true
        },
        :comments_count => {
          :type => "int"
        },
        :comments_url => {
          :type => "string"
        },
        :commentable => {
          :type => "boolean",
          :required => true
        },
        :updated_at => {
          :type => "DateTime",
          :required => true
        },
        :created_at => {
          :type => "DateTime",
          :required => true
        }
      }
    }
  end

  def sick_day_model
    {
      :id => "SickDay",
      :properties => {
        :id => {
          :type => "long",
          :required => true
        },
        :date => {
          :type => "Date",
          :required => true
        },
        :user => {
          :type => "CompactUser",
          :required => true
        },
        :url => {
          :type => "string",
          :required => true
        },
        :icon_url => {
          :type => "string",
          :required => true
        },
        :notes => {
          :type => "text",
          :required => true
        },
        :title => {
          :type => "string"
        },
        :description => {
          :type => "text"
        },
        :private => {
          :type => "boolean"
        },
        :cheers_count => {
          :type => "int"
        },
        :cheers_url => {
          :type => "string"
        },
        :cheerable => {
          :type => "boolean",
          :required => true
        },
        :comments_count => {
          :type => "int"
        },
        :comments_url => {
          :type => "string"
        },
        :commentable => {
          :type => "boolean",
          :required => true
        },
        :updated_at => {
          :type => "DateTime",
          :required => true
        },
        :created_at => {
          :type => "DateTime",
          :required => true
        }
      }
    }
  end

  def free_entry_model
    {
      :id => "FreeEntry",
      :properties => {
        :id => {
          :type => "long",
          :required => true
        },
        :date => {
          :type => "Date",
          :required => true
        },
        :user => {
          :type => "CompactUser",
          :required => true
        },
        :url => {
          :type => "string",
          :required => true
        },
        :icon_url => {
          :type => "string",
          :required => true
        },
        :notes => {
          :type => "text",
          :required => true
        },
        :title => {
          :type => "string"
        },
        :description => {
          :type => "text"
        },
        :private => {
          :type => "boolean"
        },
        :cheers_count => {
          :type => "int"
        },
        :cheers_url => {
          :type => "string"
        },
        :cheerable => {
          :type => "boolean",
          :required => true
        },
        :comments_count => {
          :type => "int"
        },
        :comments_url => {
          :type => "string"
        },
        :commentable => {
          :type => "boolean",
          :required => true
        },
        :updated_at => {
          :type => "DateTime",
          :required => true
        },
        :created_at => {
          :type => "DateTime",
          :required => true
        }
      }
    }
  end

  def entity_model
    {
      :id => "Entity",
      :properties => {
        :kind => {
          :type => "string",
          :required => true
        },
        :name => {
          :type => "string",
          :required => true
        },
        :url => {
          :type => "string"
        }
      }
    }
  end

  def entity_hash_model
    {
      :id => "EntityHash",
      :properties => {
        :'kind:id' => {
          :type => "Entity"
        }
      }
    }
  end

  def feed_model
    {
      :id => "Feed",
      :properties => {
        :id => {
          :type => "long",
          :required => true
        },
        :kind => {
          :type => "string",
          :required => true,
          :allowableValues => {
            :valueType => "LIST",
            :values => [
              "AggregatedFeedEntry",
              "FeedEntry"
            ]
          }
        },
        :url => {
          :type => "string",
          :required => true
        },
        :icon_url => {
          :type => "string"
        },
        :title => {
          :type => "string"
        },
        :description => {
          :type => "text"
        },
        :private => {
          :type => "boolean"
        },
        :cheers_count => {
          :type => "int"
        },
        :cheers_url => {
          :type => "string"
        },
        :cheerable => {
          :type => "boolean",
          :required => true
        },
        :comments_count => {
          :type => "int"
        },
        :comments_url => {
          :type => "string"
        },
        :commentable => {
          :type => "boolean",
          :required => true
        },
        :updated_at => {
          :type => "DateTime",
          :required => true
        },
        :created_at => {
          :type => "DateTime",
          :required => true
        },
        :dict => {
          :type => "EntityHash"
        },
        :properties => {
          :items => {
            :$ref => "Entity"
          },
          :type => "List"
        }
      }
    }
  end


  def models(*args)
    hash = {}
    model_names(args).each do |model|
      hash[model] = send("#{model.underscore}_model")
    end
    hash.to_json
  end

  private

  def model_dependencies
    {
      'Cheer' => ['CheerType', 'CompactUser'],
      'CheerType' => [],
      'Comment' => ['CompactUser'],
      'CompactSport' => [],
      'CompactUser' => [],
      'Entity' => [],
      'EntityHash' => ['Entity'],
      'Feed' => ['EntityHash'],
      'FreeEntry' => ['CompactUser'],
      'Place' => [],
      'SickDay' => ['CompactUser'],
      'Sport' => ['SportParam'],
      'SportParam' => [],
      'TrainingLog' => ['CompactSport', 'CompactUser', 'SportParam', 'Place'],
      'User' => ['TrainingLog'],
      'Weight' => ['CompactUser'],
    }
  end

  def model_names(*args)
    set = Set.new
    args.flatten.each do |model|
      set << model
      model_names(model_dependencies.fetch(model, [])).each do |dep|
        set << dep
      end
    end
    set
  end

end
