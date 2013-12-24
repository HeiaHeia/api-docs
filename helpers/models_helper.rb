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
        :created_at => {
          :type => Const::DATE_TIME,
          :required => true
        },
        :removable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :editable => {
          :type => Const::BOOLEAN,
          :required => true
        }
      }
    }
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
          :description => "for heiaheia users https://avatars-heiaheia-com.s3.amazonaws.com/images/avatars/IMAGE_ID/{size}.jpg,
                           {size} - possible size of image(could be 30x30, 34x34, 48x48, 64x64, 72x72, 73x73, 80x80, 96x96, 120x120, 144x144)",
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
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
          :description => "for heiaheia users https://avatars-heiaheia-com.s3.amazonaws.com/images/avatars/IMAGE_ID/{size}.jpg,
                           {size} - possible size of image(could be 30x30, 34x34, 48x48, 64x64, 72x72, 73x73, 80x80, 96x96, 120x120, 144x144)",
          :required => true
        },
        :locale => {
          :type => Const::STRING,
          :required => true
        },
        :privacy => {
          :type => Const::STRING,
          :required => true,
          :allowableValues => {
            :valueType => Const::LIST,
            :values => Const::PRIVACIES
          }
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
        },
        :items_url => {
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
        :key => {
          :type => Const::STRING,
          :required => true,
          :description => 'score, avg_speed, max_speed, best_lap_time, etc. Depends on the sport.'
        },
        :name => {
          :type => Const::STRING,
          :required => true,
          :description => 'Human readable name. Depends on user locale'
        },
        :unit_type => {
          :type => Const::STRING,
          :required => true,
          :description => 'mi, km, ft, m, mph, kmph, sec, f, c or empty. Depends on user unit system'
        },
        :unit_name => {
          :type => Const::STRING,
          :required => true,
          :description => 'Human readable format: "mi, km, ft, m, mph, km/h, sec, °F, °C, ''". Depends on user locale and unit system'
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
        },
        :distance => {
          :type => Const::BOOLEAN,
          :required => true,
          :description => 'Params distance or not.'
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
        },
        :removable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :editable => {
          :type => Const::BOOLEAN,
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
        }
      }
    }
  end

  def compact_sport_category_model
    {
      :id => Const::COMPACT_SPORT_CATEGORY,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :name => {
          :type => Const::STRING,
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
        :sports_url => {
          :type => Const::STRING,
          :required => true
        }
      }
    }
  end

  def sport_category_model
    {
      :id => Const::SPORT_CATEGORY,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :name => {
          :type => Const::STRING,
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
        :sports_url => {
          :type => Const::STRING,
          :required => true
        },
        :sports => {
          :items => {
            :$ref => Const::SPORT
          },
          :type => Const::ARRAY
        }
      }
    }
  end

  def top_sport_model
    {
      :id => Const::TOP_SPORT,
      :properties => {
        :sport => {
          :type => Const::COMPACT_SPORT,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :count => {
          :type => Const::INT,
          :required => true
        },
        :hours => {
          :type => Const::INT
        },
        :minutes => {
          :type => Const::INT
        },
        :distance => {
          :type => Const::INT,
          :description => 'In unit that set in the user settings (km or mi)'
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
        },
        :removable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :editable => {
          :type => Const::BOOLEAN,
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
          :type => Const::ARRAY,
          :description => "Contain all sport parameter values even if they have not been set"
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
        },
        :removable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :editable => {
          :type => Const::BOOLEAN,
          :required => true
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
          :description => "Example https://www.heiaheia.com/images/icons/weight_logs/weight_log_{size}.jpg,
                           {size} - possible size of image(could be 48x48, 64x64, 72x72, 80x80, 96x96, 144x144, 192x192)",
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
        },
        :removable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :editable => {
          :type => Const::BOOLEAN,
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
          :description => "Example https://www.heiaheia.com/images/icons/sick_days/sick_day_{size}.jpg,
                           {size} - possible size of image(could be 48x48, 64x64, 72x72, 80x80, 96x96, 144x144, 192x192)",
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
        },
        :removable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :editable => {
          :type => Const::BOOLEAN,
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
          :description => "Example https://www.heiaheia.com/images/icons/free_entries/free_entry_{size}.jpg,
                           {size} - possible size of image(could be 48x48, 64x64, 72x72, 80x80, 96x96, 144x144, 192x192)",
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
        },
        :removable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :editable => {
          :type => Const::BOOLEAN,
          :required => true
        }
      }
    }
  end

  def medal_model
    {
      :id => Const::MEDAL,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :year => {
          :type => Const::INT,
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
        :title => {
          :type => Const::STRING,
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
        },
        :removable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :editable => {
          :type => Const::BOOLEAN,
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
          :description => "Example https://www.heiaheia.com/images/icons/training_goals/training_goal_{size}.jpg,
                           {size} - possible size of image(could be 48x48, 64x64, 72x72, 80x80, 96x96, 144x144, 192x192)",
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
        },
        :removable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :editable => {
          :type => Const::BOOLEAN,
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
        },
        :removable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :editable => {
          :type => Const::BOOLEAN,
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
        :conversation_url => {
          :type => Const::STRING,
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

  def conversation_model
    {
      :id => Const::CONVERSATION,
      :properties => {
        :user_id => {
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
        :last_message => {
          :type => Const::MESSAGE,
          :required => true
        },
        :unread => {
          :type => Const::BOOLEAN,
          :required => true
        }
      }
    }
  end

  def item_types
    [
      Const::TRAINING_LOG,
      Const::FREE_ENTRY,
      Const::WEIGHT,
      Const::SICK_DAY,
      Const::MEDAL,
      Const::TRAINING_GOAL
    ]
  end

  def item_model
    {
      :id => Const::Item,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :entry => {
          :type => item_types.join(' | '),
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
      Const::MESSAGE => [Const::COMPACT_USER],
      Const::PLACE => [],
      Const::SICK_DAY => [Const::COMPACT_USER],
      Const::SPORT => [Const::SPORT_PARAM],
      Const::SPORT_PARAM => [],
      Const::SPORT_PARAM_VALUE => [ Const::SPORT_PARAM ],
      Const::CONVERSATION => [],
      Const::TRAINING_GOAL => [Const::COMPACT_USER],
      Const::TRAINING_LOG => [Const::COMPACT_SPORT, Const::COMPACT_USER, Const::PLACE, Const::SPORT_PARAM_VALUE],
      Const::USER => [],
      Const::WEIGHT => [Const::COMPACT_USER],
      Const::MEDAL => [Const::COMPACT_USER],
      Const::Item => [Const::COMPACT_USER]
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
