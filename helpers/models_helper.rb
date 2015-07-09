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
          :description => common_icon_description,
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
        },
        :country => {
          :type => Const::STRING
        },
        :city => {
          :type => Const::STRING
        },
        :training_for => {
          :type => Const::STRING
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
          :description => common_icon_description,
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
        :training_for => {
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
          :description => 'mi, km, ft, m, mph, kmph, sec, f, c, rpm or empty. Depends on user unit system'
        },
        :unit_name => {
          :type => Const::STRING,
          :required => true,
          :description => 'Human readable format: "mi, km, ft, m, mph, km/h, sec, °F, °C, rpm ''". Depends on user locale and unit system'
        },
        :value_type => {
          :allowableValues => {
            :valueType => Const::LIST,
            :values => [
              Const::INT,
              Const::FLOAT,
              Const::STRING,
              Const::BOOLEAN
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
          :required => true,
          :description => common_icon_description
        },
        :planned_icon_url => {
          :type => Const::STRING,
          :required => true,
          :description => common_icon_description
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
          :required => true,
          :description => common_icon_description
        },
        :planned_icon_url => {
          :type => Const::STRING,
          :required => true,
          :description => common_icon_description
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
        dummy: {
          required: true,
          type: Const::BOOLEAN
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
          :required => true,
          :description => common_icon_description
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
          :required => true,
          :description => common_icon_description
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
          :description => "Template URL 'https://example.com/path/to/image/{height}.png',
                            where '{height}' value can be from this list ['34', '44', '48', '60', '64', '72', '80', '96', '128', '144', '192']",
          :required => true
        },
        :level => {
          :type => Const::BYTE,
          :required => true
        }
      }
    }
  end

  def tag_model
    {
      :id => Const::TAG,
      :properties => {
        :type => {
          :type => Const::STRING,
          :required => true,
          :allowableValues => {
            :valueType => Const::LIST,
            :values => %w(strain commute own)
          }
        },
        :name => {
          :type => Const::STRING,
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
        :latest_cheers => {
          :items => {
            :$ref => Const::CHEER
          },
          :type => Const::ARRAY
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
        :tags => {
          :items => {
            :$ref => Const::TAG
          },
          :type => Const::ARRAY
        },
        :removable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :editable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        editable_sport: {
          type: Const::BOOLEAN,
          required: true
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
          :description => extra_model_icon_description,
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
        :latest_cheers => {
          :items => {
            :$ref => Const::CHEER
          },
          :type => Const::ARRAY
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
          :description => extra_model_icon_description,
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
        :latest_cheers => {
          :items => {
            :$ref => Const::CHEER
          },
          :type => Const::ARRAY
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

  def v3_entry_model(const)
    {
      :id => const,
      :properties => {
        :id => {
          :type => Const::LONG,
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
          :description => extra_model_icon_description,
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
        :latest_cheers => {
          :items => {
            :$ref => Const::CHEER
          },
          :type => Const::ARRAY
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
          :description => "Example https://example.com/path/to/image/{width}.png,
                           {width} - possible width of image(could be 48, 64, 72, 80, 96, 120, 144, 192).
                           Icon can be with dimension WxW or Wx4/3*W. All sizes of icons:
                           48x48, 48x64, 64x64, 64x85, 72x72, 72x96, 80x80, 80x107, 96x96, 96x128, 120x120, 120x160, 144x144, 144x192, 192x192, 192x256",
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
        :latest_cheers => {
          :items => {
            :$ref => Const::CHEER
          },
          :type => Const::ARRAY
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
          :description => "Example https://example.com/path/to/image/{size}.png,
                           {size} - possible size of image(could be 48x48, 64x64, 72x72, 80x80, 96x96, 120x120, 144x144, 192x192)",
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
      Const::TRAINING_GOAL,
      Const::MEGAPHONE,
      Const::WELLNESS_ENTRY,
      Const::PERSONAL_PROGRAM
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
      Const::TRAINING_GOAL,
      Const::MEGAPHONE,
      Const::WELLNESS_ENTRY,
      Const::PERSONAL_PROGRAM
    ]
  end

  def item_model
    {
      :id => Const::ITEM,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :kind => {
          :type => Const::STRING,
          :required => true,
          :allowableValues => {
            :valueType => Const::LIST,
            :values => item_types
          }
        },
        :entry => {
          :type => item_types.join(' | '),
          :required => true
        }
      }
    }
  end

  def megaphone_model
    {
      :id => Const::MEGAPHONE,
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
        :organisation_name => {
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
        :latest_cheers => {
          :items => {
            :$ref => Const::CHEER
          },
          :type => Const::ARRAY
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
        :removable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :editable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :created_at => {
          :type => Const::DATE_TIME,
          :required => true
        },
        :image_url => {
          :type => Const::STRING
        }
      }
    }
  end

  def wellness_type_model
    {
      :id => Const::WELLNESS_TYPE,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :title => {
          :type => Const::STRING,
          :required => true
        },
        :description => {
          :type => Const::STRING,
          :required => true
        },
        :is_tip => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :params => {
          :items => {
            :$ref => Const::WELLNESS_PARAM
          },
          :type => Const::ARRAY
        },
        :icon_url => {
          :type => Const::STRING,
          :required => true,
          :description => common_icon_description
        },
        :planned_icon_url => {
          :type => Const::STRING,
          :required => true,
          :description => common_icon_description
        },
        :url => {
          :type => Const::STRING,
          :required => true
        }
      }
    }
  end

  def v3_wellness_type_model
    {
      :id => Const::WELLNESS_TYPE,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :title => {
          :type => Const::STRING,
          :required => true
        },
        :description => {
          :type => Const::STRING,
          :required => true
        },
        :params => {
          :items => {
            :$ref => Const::WELLNESS_PARAM
          },
          :type => Const::ARRAY
        },
        :icon_url => {
          :type => Const::STRING,
          :required => true,
          :description => common_icon_description
        },
        :planned_icon_url => {
          :type => Const::STRING,
          :required => true,
          :description => common_icon_description
        },
        :url => {
          :type => Const::STRING,
          :required => true
        }
      }
    }
  end

  def wellness_entry_model
    {
      :id => Const::WELLNESS_ENTRY,
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
        :status => {
          :allowableValues => {
            :valueType => Const::LIST,
            :values => %w(regular planned)
          },
          :type => Const::STRING,
          :required => true
        },
        :wellness_type => {
          :type => Const::WELLNESS_TYPE,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :icon_url => {
          :type => Const::STRING,
          :description => common_icon_description,
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
        :param_values => {
          :items => {
            :$ref => Const::WELLNESS_PARAM_VALUE
          },
          :type => Const::ARRAY,
          :description => "Contain parameter values"
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
        :latest_cheers => {
          :items => {
            :$ref => Const::CHEER
          },
          :type => Const::ARRAY
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

  def wellness_param_model
    {
      :id => Const::WELLNESS_PARAM,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :name => {
          :type => Const::STRING,
          :required => true
        },
        :value_type => {
          :allowableValues => {
            :valueType => Const::LIST,
            :values => [
              Const::INT,
              Const::FLOAT,
              Const::BOOLEAN,
              Const::CHECKBOX,
              Const::RADIO
            ]
          },
          :type => Const::STRING,
          :required => true
        },
        :options => {
          :items => {
            :$ref => Const::WELLNESS_PARAM_OPTION
          },
          :type => Const::ARRAY,
          :description => "Available when value type is radio or checkbox"
        }
      }
    }
  end

  def wellness_param_option_model
    {
      :id => Const::WELLNESS_PARAM_OPTION,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :name => {
          :type => Const::STRING,
          :required => true
        }
      }
    }
  end

  def wellness_param_value_model
    {
      :id => Const::WELLNESS_PARAM_VALUE,
      :properties => {
        :value => {
          :type => 'int,float,boolean,option_id,array[option_id]',
          :required => true
        },
        :param => {
          :type => Const::WELLNESS_PARAM,
          :required => true
        }
      }
    }
  end

  def program_model
    {
      :id => Const::PROGRAM,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :title => {
          :type => Const::STRING,
          :required => true
        },
        :description => {
          :type => Const::STRING,
          :required => true
        },
        :icon_url => {
          :type => Const::STRING,
          :required => true,
          :description => common_icon_description
        },
        :url => {
          :type => Const::STRING,
          :required => true
        }
      }
    }
  end

  def personal_program_model
    {
      :id => Const::PERSONAL_PROGRAM,
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
        :program => {
          :type => Const::PROGRAM,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :title => {
          :type => Const::STRING,
          :required => true
        },
        :description => {
          :type => Const::TEXT
        },
        :start_date => {
          :type => Const::DATE,
          :required => true
        },
        :end_date => {
          :type => Const::DATE,
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
        :latest_cheers => {
          :items => {
            :$ref => Const::CHEER
          },
          :type => Const::ARRAY
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

  def survey_model
    {
      :id => Const::SURVEY,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :title => {
          :type => Const::STRING,
          :required => true
        },
        :description => {
          :type => Const::TEXT
        },
        :questions => {
          :items => {
            :$ref => Const::QUESTION
          },
          :type => Const::ARRAY,
          :required => true
        },
        :icon_url => {
          :type => Const::STRING,
          :required => true,
          :description => common_icon_description
        },
        :url => {
          :type => Const::STRING,
          :required => true
        }
      }
    }
  end

  def compact_survey_model
    {
      :id => Const::COMPACT_SURVEY,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :title => {
          :type => Const::STRING,
          :required => true
        },
        :description => {
          :type => Const::TEXT
        },
        :icon_url => {
          :type => Const::STRING,
          :required => true,
          :description => common_icon_description
        },
        :url => {
          :type => Const::STRING,
          :required => true
        }
      }
    }
  end

  def question_model
    {
      :id => Const::QUESTION,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :title => {
          :type => Const::STRING,
          :required => true
        },
        :description => {
          :type => Const::TEXT
        },
        :options => {
          :items => {
            :$ref => Const::QUESTION_OPTION
          },
          :type => Const::ARRAY,
          :required => true
        },
        :kind => {
          :allowableValues => {
            :valueType => Const::LIST,
            :values => [
              Const::BMI,
              Const::STAR,
              Const::BOOLEAN,
              Const::CHECKBOX,
              Const::RADIO,
              Const::DROPDOWN
            ]
          },
          :type => Const::STRING,
          :required => true
        },
        :notable => {
          :type => Const::BOOLEAN,
          :required => true
        }
      }
    }
  end

  def question_option_model
    {
      :id => Const::QUESTION_OPTION,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :title => {
          :type => Const::STRING,
          :required => true
        },
        :conclusion => {
          :type => Const::STRING,
          :required => true
        },
        :icon_url => {
          :type => Const::STRING,
          :description => extra_model_icon_description,
          :required => true
        }
      }
    }
  end

  def survey_result_model
    {
      :id => Const::SURVEY_RESULT,
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
        :survey => {
          :type => Const::COMPACT_SURVEY,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :icon_url => {
          :type => Const::STRING,
          :description => extra_model_icon_description,
          :required => true
        },
        :title => {
          :type => Const::STRING,
          :required => true
        },
        :description => {
          :type => Const::TEXT
        },
        :answers => {
          :items => {
            :$ref => Const::ANSWER
          },
          :type => Const::ARRAY,
          :required => true
        },
        :feedbacks => {
          :items => {
            :$ref => Const::SURVEY_FEEDBACK
          },
          :type => Const::ARRAY
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
        :latest_cheers => {
          :items => {
            :$ref => Const::CHEER
          },
          :type => Const::ARRAY
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

  def answer_model
    {
      :id => Const::ANSWER,
      :properties => {
        :title => {
          :type => Const::STRING,
          :required => true
        },
        :options => {
          :items => {
            :$ref => Const::QUESTION_OPTION
          },
          :type => Const::ARRAY,
          :required => true
        },
        :note => {
          :type => Const::TEXT
        }
      }
    }
  end

  def planned_survey_model
    {
      :id => Const::PLANNED_SURVEY,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :date => {
          :type => Const::DATE,
          :required => true
        },
        :survey => {
          :type => Const::SURVEY,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        }
      }
    }
  end

  def notification_model
    {
      :id => Const::NOTIFICATION,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :message => {
          :type => Const::STRING,
          :required => true
        },
        :actors => {
          :items => {
            :$ref => Const::COMPACT_USER
          },
          :type => Const::ARRAY
        },
        :action => {
          :type => Const::STRING,
          :required => true
        },
        :object => {
          :type => Const::NOTIFICATION_OBJECT,
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

  def notification_object_model
    {
      :id => Const::NOTIFICATION_OBJECT,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :kind => {
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

  def survey_feedback_model
    {
      :id => Const::SURVEY_FEEDBACK,
      :properties => {
        :type => {
          :type => Const::STRING,
          :required => true,
          :allowableValues => {
            :valueType => Const::LIST,
            :values => %w(per_question subtotal total)
          }
        },
        :conclusion => {
          :type => Const::STRING,
          :required => true
        },
        :icon_url => {
          :type => Const::STRING,
          :description => extra_model_icon_description,
          :required => true
        }
      }
    }
  end

  def models(version, *args)
    hash = {}
    model_names(args).each do |model|
      if respond_to?("v#{version}_#{model.underscore}_model")
        hash[model] = send("v#{version}_#{model.underscore}_model")
      else
        hash[model] = send("#{model.underscore}_model")
      end
    end
    hash.to_json
  end

  def v3_entry_models(*args)
    hash = {}
    model_names(args).each do |model|
      hash[model] = v3_entry_model(model)
    end
    hash.to_json
  end

  def model_dependencies
    {
      Const::ANSWER => [Const::QUESTION, Const::QUESTION_OPTION],
      Const::CHEER => [Const::CHEER_TYPE, Const::COMPACT_USER],
      Const::CHEER_TYPE => [],
      Const::COMMENT => [Const::COMPACT_USER],
      Const::COMPACT_SPORT => [],
      Const::COMPACT_SURVEY => [],
      Const::COMPACT_USER => [],
      Const::CONVERSATION => [],
      Const::FEED => [],
      Const::FREE_ENTRY => [Const::COMPACT_USER, Const::CHEER],
      Const::ITEM => [Const::COMPACT_USER],
      Const::MEDAL => [Const::COMPACT_USER, Const::CHEER],
      Const::MEGAPHONE => [Const::COMPACT_USER, Const::CHEER],
      Const::MESSAGE => [Const::COMPACT_USER],
      Const::NOTIFICATION => [Const::COMPACT_USER, Const::NOTIFICATION_OBJECT],
      Const::NOTIFICATION_OBJECT => [],
      Const::PERSONAL_PROGRAM => [Const::COMPACT_USER, Const::PROGRAM, Const::CHEER],
      Const::PLACE => [],
      Const::PLANNED_SURVEY => [Const::SURVEY],
      Const::PROGRAM => [],
      Const::QUESTION => [Const::QUESTION_OPTION],
      Const::SICK_DAY => [Const::COMPACT_USER, Const::CHEER],
      Const::SPORT => [Const::SPORT_PARAM],
      Const::SPORT_PARAM => [],
      Const::SPORT_PARAM_VALUE => [Const::SPORT_PARAM],
      Const::SURVEY => [Const::QUESTION],
      Const::SURVEY_RESULT => [Const::ANSWER, Const::COMPACT_SURVEY, Const::SURVEY_FEEDBACK, Const::COMPACT_USER, Const::CHEER],
      Const::TAG => [],
      Const::TRAINING_GOAL => [Const::COMPACT_USER],
      Const::TRAINING_LOG => [Const::COMPACT_SPORT, Const::COMPACT_USER, Const::PLACE, Const::SPORT_PARAM_VALUE, Const::TAG, Const::CHEER],
      Const::USER => [],
      Const::WEIGHT => [Const::COMPACT_USER, Const::CHEER],
      Const::WELLNESS_ENTRY => [Const::COMPACT_USER, Const::WELLNESS_TYPE, Const::WELLNESS_PARAM_VALUE, Const::CHEER],
      Const::WELLNESS_PARAM => [Const::WELLNESS_PARAM_OPTION],
      Const::WELLNESS_PARAM_OPTION => [],
      Const::WELLNESS_PARAM_VALUE => [Const::WELLNESS_PARAM],
      Const::WELLNESS_TYPE => [Const::WELLNESS_PARAM]
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

  def common_icon_description
    "Template URL 'https://example.com/path/to/image/{size}.png',
     where '{size}' value can be from this list ['30x30', '34x34', '48x48', '64x64, '72x72', '80x80', '96x96', '120x120', '144x144', '192x192']"
  end

  def extra_model_icon_description
    "Example https://example.com/path/to/image/{size}.png,
     {size} - possible size of image(could be 48x48, 64x64, 72x72, 80x80, 96x96, 120x120, 144x144, 192x192)"
  end

end
