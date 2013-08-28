# -*- encoding: utf-8 -*-

require 'set'
require 'ext/string'
require 'const'

module ModelsHelper

  def comment_model
    {
      :id => Const::COMMENT,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :user => {
          :type => Const::COMPACT_USER,
          :required => true
        },
        :notes => {
          :type => Const::TEXT,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :avatar_url => {
          :type => Const::STRING,
          :required => true
        },
        :removable => {
          :type => Const::BOOLEAN,
          :required => true
        }
      }
    }.to_json
  end

  def compact_user_model
    {
      :id => Const::COMPACT_USER,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :first_name => {
          :type => Const::STRING,
          :required => true
        },
        :last_name => {
          :type => Const::STRING
        },
        :avatar_url => {
          :type => Const::STRING,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        }
      }
    }
  end

  def user_model
    {
      :id => Const::USER,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :first_name => {
          :type => Const::STRING,
          :required => true
        },
        :last_name => {
          :type => Const::STRING
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :created_at => {
          :type => Const::DATE_TIME,
          :required => true
        },
        :avatar_url => {
          :type => Const::STRING,
          :required => true
        },
        :locale => {
          :type => Const::STRING,
          :required => true
        },
        :measurement_units => {
          :type => Const::STRING,
          :required => true,
          :allowableValues => {
            :valueType => Const::LIST,
            :values => %w(metric imperial)
          }
        },
        :birthday => {
          :type => Const::DATE
        },
        :gender => {
          :type => Const::STRING,
          :allowableValues => {
            :valueType => Const::LIST,
            :values => %w(male female)
          }
        },
        :country => {
          :type => Const::STRING
        },
        :city => {
          :type => Const::STRING
        },
        :level => {
          :type => Const::STRING,
          :required => true,
          :allowableValues => {
            :valueType => Const::LIST,
            :values => %w(rookie bronze silver gold diamond pro)
          }
        },
        :my_sports => {
          :type => Const::TEXT
        },
        :records_and_highlights => {
          :type => Const::TEXT
        },
        :training_logs_count => {
          :type => Const::INT,
          :required => true
        },
        :training_logs_url => {
          :type => Const::STRING,
          :required => true
        },
        :medals_count => {
          :type => Const::INT,
          :required => true
        },
        :medals_url => {
          :type => Const::STRING,
          :required => true
        },
        :friends_count => {
          :type => Const::INT,
          :required => true
        },
        :friends_url => {
          :type => Const::STRING,
          :required => true
        },
        :top_sports_url => {
          :type => Const::STRING,
          :required => true
        },
        :latest_activity => {
          :type => Const::TRAINING_LOG
        },
        :training_goal => {
          :type => Const::TRAINING_GOAL
        },
        :friendship_status => {
          :type => Const::STRING,
          :description => "\"pending\" when you sent the friend request, \"requested\" when friend request was sent to you",
          :required => true,
          :allowableValues => {
            :valueType => Const::LIST,
            :values => %w(not_friend friend requested pending)
          }

        },
        :friendship_url => {
          :type => Const::STRING,
          :required => true
        }
      }
    }
  end

  def sport_param_model
    {
      :id => Const::SPORT_PARAM,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :unit_type => {
          :type => Const::STRING,
          :required => true,
          :description => 'mi, km, foot, m, min, f, c, hms or empty. Depends on user unit system'
        },
        :unit_name => {
          :type => Const::STRING,
          :required => true,
          :description => 'Human readable format: "mi, km, ft, m, min, h, bpm, mph, km/h, sec, °F, °C, ''". Depends on user locale and unit system'
        },
        :value_type => {
          :allowableValues => {
            :valueType => Const::LIST,
            :values => [
              Const::INT,
              Const::FLOAT,
              Const::STRING
            ]
          },
          :type => Const::STRING,
          :required => true
        }
      }
    }
  end

  def sport_param_value_model
    {
      :id => Const::SPORT_PARAM_VALUE,
      :properties => {
        :value => {
          :type => 'int,float,string',
          :required => true
        },
        :sport_param => {
          :type => Const::SPORT_PARAM,
          :required => true
        }
      }
    }
  end

  def cheer_model
    {
      :id => Const::CHEER,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :user => {
          :type => Const::COMPACT_USER,
          :required => true
        },
        :cheer_type => {
          :type => Const::CHEER_TYPE,
          :required => true
        },
        :created_at => {
          :type => Const::DATE_TIME,
          :required => true
        }
      }
    }
  end

  def compact_sport_model
    {
      :id => Const::COMPACT_SPORT,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :name => {
          :type => Const::STRING,
          :required => true
        },
        :icon_url => {
          :type => Const::STRING,
          :required => true
        },
        :planned_icon_url => {
          :type => Const::STRING,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        }
      }
    }
  end

  def sport_model
    {
      :id => Const::SPORT,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :name => {
          :type => Const::STRING,
          :required => true
        },
        :icon_url => {
          :type => Const::STRING,
          :required => true
        },
        :planned_icon_url => {
          :type => Const::STRING,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :sport_params => {
          :items => {
            :$ref => Const::SPORT_PARAM
          },
          :type => Const::ARRAY
        },
        :exclude_stats => {
          :required => true,
          :type => Const::BOOLEAN
        },
        :created_at => {
          :type => Const::DATE_TIME,
          :required => true
        }
      }
    }
  end

  def cheer_type_model
    {
      :id => Const::CHEER_TYPE,
      :properties => {
        :id => {
          :type => Const::INT,
          :required => true
        },
        :icon_url => {
          :type => Const::STRING,
          :required => true
        },
        :level => {
          :type => Const::BYTE,
          :required => true
        }
      }
    }
  end

  def place_model
    {
      :id => Const::PLACE,
      :properties => {
        :id => {
          :type => Const::INT,
          :required => true
        },
        :name => {
          :type => Const::STRING,
          :required => true
        },
        :latitude => {
          :type => Const::DOUBLE,
          :required => true
        },
        :longitude => {
          :type => Const::DOUBLE,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        }
      }
    }
  end

  def training_log_model
    {
      :id => Const::TRAINING_LOG,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :date => {
          :type => Const::DATE,
          :required => true
        },
        :status => {
          :allowableValues => {
            :valueType => Const::LIST,
            :values => %w(regular planned)
          },
          :type => Const::STRING,
          :required => true
        },
        :sport => {
          :type => Const::COMPACT_SPORT,
          :required => true
        },
        :user => {
          :type => Const::COMPACT_USER,
          :required => true
        },
        :notes => {
          :type => Const::TEXT,
          :required => true
        },
        :title => {
          :type => Const::STRING,
          :required => true
        },
        :description => {
          :type => Const::TEXT
        },
        :mood => {
          :type => Const::BYTE,
          :required => true,
          :description => 'A value from 0 to 5. Where 0 - no mood set, 1 - worst mood, 5 - best mood'
        },
        :mood_icon_url => {
          :type => Const::STRING,
          :required => true
        },
        :calories => {
          :type => Const::INT
        },
        :duration_h => {
          :type => Const::INT
        },
        :duration_m => {
          :type => Const::INT
        },
        :duration_s => {
          :type => Const::INT
        },
        :avg_hr => {
          :type => Const::INT
        },
        :max_hr => {
          :type => Const::INT
        },
        :sport_param_values => {
          :items => {
            :$ref => Const::SPORT_PARAM_VALUE
          },
          :type => Const::ARRAY
        },
        :favourite => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :private => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :exclude_stats => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :cheers_count => {
          :type => Const::INT,
          :required => true
        },
        :cheers_url => {
          :type => Const::STRING,
          :required => true
        },
        :cheerable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :comments_count => {
          :type => Const::INT,
          :required => true
        },
        :comments_url => {
          :type => Const::STRING,
          :required => true
        },
        :commentable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :place => {
          :type => Const::PLACE
        },
        :created_at => {
          :type => Const::DATE_TIME,
          :required => true
        },
        :gpx_url => {
          :type => Const::STRING
        }
      }
    }
  end

  def weight_model
    {
      :id => Const::WEIGHT,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :date => {
          :type => Const::DATE,
          :required => true
        },
        :user => {
          :type => Const::COMPACT_USER,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :icon_url => {
          :type => Const::STRING,
          :required => true
        },
        :notes => {
          :type => Const::TEXT,
          :required => true
        },
        :title => {
          :type => Const::STRING,
          :required => true
        },
        :description => {
          :type => Const::TEXT
        },
        :value => {
          :type => Const::FLOAT,
          :required => true,
          :description => 'In unit that set in the user settings (kg or lb)'
        },
        :private => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :cheers_count => {
          :type => Const::INT,
          :required => true
        },
        :cheers_url => {
          :type => Const::STRING,
          :required => true
        },
        :cheerable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :comments_count => {
          :type => Const::INT,
          :required => true
        },
        :comments_url => {
          :type => Const::STRING,
          :required => true
        },
        :commentable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :created_at => {
          :type => Const::DATE_TIME,
          :required => true
        }
      }
    }
  end

  def sick_day_model
    {
      :id => Const::SICK_DAY,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :date => {
          :type => Const::DATE,
          :required => true
        },
        :user => {
          :type => Const::COMPACT_USER,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :icon_url => {
          :type => Const::STRING,
          :required => true
        },
        :notes => {
          :type => Const::TEXT,
          :required => true
        },
        :title => {
          :type => Const::STRING,
          :required => true
        },
        :description => {
          :type => Const::TEXT
        },
        :private => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :cheers_count => {
          :type => Const::INT,
          :required => true
        },
        :cheers_url => {
          :type => Const::STRING,
          :required => true
        },
        :cheerable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :comments_count => {
          :type => Const::INT,
          :required => true
        },
        :comments_url => {
          :type => Const::STRING,
          :required => true
        },
        :commentable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :created_at => {
          :type => Const::DATE_TIME,
          :required => true
        }
      }
    }
  end

  def free_entry_model
    {
      :id => Const::FREE_ENTRY,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :date => {
          :type => Const::DATE,
          :required => true
        },
        :user => {
          :type => Const::COMPACT_USER,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :icon_url => {
          :type => Const::STRING,
          :required => true
        },
        :notes => {
          :type => Const::TEXT,
          :required => true
        },
        :title => {
          :type => Const::STRING,
          :required => true
        },
        :description => {
          :type => Const::TEXT
        },
        :private => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :cheers_count => {
          :type => Const::INT,
          :required => true
        },
        :cheers_url => {
          :type => Const::STRING,
          :required => true
        },
        :cheerable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :comments_count => {
          :type => Const::INT,
          :required => true
        },
        :comments_url => {
          :type => Const::STRING,
          :required => true
        },
        :commentable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :created_at => {
          :type => Const::DATE_TIME,
          :required => true
        }
      }
    }
  end

  def training_goal_model
    {
      :id => Const::TRAINING_GOAL,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :user => {
          :type => Const::COMPACT_USER,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :icon_url => {
          :type => Const::STRING,
          :required => true
        },
        :notes => {
          :type => Const::TEXT,
          :required => true
        },
        :title => {
          :type => Const::STRING,
          :required => true
        },
        :description => {
          :type => Const::TEXT
        },
        :private => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :cheers_count => {
          :type => Const::INT,
          :required => true
        },
        :cheers_url => {
          :type => Const::STRING,
          :required => true
        },
        :cheerable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :comments_count => {
          :type => Const::INT,
          :required => true
        },
        :comments_url => {
          :type => Const::STRING,
          :required => true
        },
        :commentable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :created_at => {
          :type => Const::DATE_TIME,
          :required => true
        }
      }
    }
  end

  def feed_types
    [
      Const::TEXT_ENTRY,
      Const::TRAINING_LOG,
      Const::FREE_ENTRY,
      Const::WEIGHT,
      Const::SICK_DAY,
      Const::MEDAL,
      Const::TRAINING_GOAL
    ]
  end

  def feed_model
    {
      :id => Const::FEED,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :kind => {
          :type => Const::STRING,
          :required => true,
          :allowableValues => {
            :valueType => Const::LIST,
            :values => feed_types
          }
        },
        :entry => {
          :type => feed_types.join(' | '),
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :created_at => {
          :type => Const::DATE_TIME,
          :required => true
        }
      }
    }
  end

  def message_model
    {
      :id => Const::MESSAGE,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :from => {
          :type => Const::COMPACT_USER,
          :required => true
        },
        :to => {
          :type => Const::COMPACT_USER,
          :required => true
        },
        :thread => {
          :type => Const::THREAD,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :body => {
          :type => Const::TEXT,
          :required => true
        },
        :unread => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :created_at => {
          :type => Const::DATE_TIME,
          :required => true
        }
      }
    }
  end

  def thread_model
    {
      :id => Const::THREAD,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :messages_url => {
          :type => Const::STRING,
          :required => true
        },
        :unread => {
          :type => Const::BOOLEAN,
          :required => true
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

  def model_dependencies
    {
      Const::CHEER => [Const::CHEER_TYPE, Const::COMPACT_USER],
      Const::CHEER_TYPE => [],
      Const::COMMENT => [Const::COMPACT_USER],
      Const::COMPACT_SPORT => [],
      Const::COMPACT_USER => [],
      Const::FEED => [],
      Const::FREE_ENTRY => [Const::COMPACT_USER],
      Const::MESSAGE => [Const::COMPACT_USER, Const::THREAD],
      Const::PLACE => [],
      Const::SICK_DAY => [Const::COMPACT_USER],
      Const::SPORT => [Const::SPORT_PARAM],
      Const::SPORT_PARAM => [],
      Const::SPORT_PARAM_VALUE => [ Const::SPORT_PARAM ],
      Const::THREAD => [],
      Const::TRAINING_GOAL => [Const::COMPACT_USER],
      Const::TRAINING_LOG => [Const::COMPACT_SPORT, Const::COMPACT_USER, Const::PLACE, Const::SPORT_PARAM_VALUE],
      Const::USER => [Const::TRAINING_LOG, Const::TRAINING_GOAL],
      Const::WEIGHT => [Const::COMPACT_USER],
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
