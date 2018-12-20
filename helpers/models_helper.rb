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
      id: Const::COMPACT_USER,
      properties: {
        id: { type: Const::LONG, required: true },
        first_name: { type: Const::STRING, required: true },
        last_name: { type: Const::STRING },
        avatar_url: { type: Const::STRING, required: true, description: common_icon_description },
        url: { type: Const::STRING, required: true },
        friendship_status: {
          type: Const::STRING,
          required: true,
          description: "\"pending\" when you sent the friend request, \"requested\" when friend request was sent to you",
          allowableValues: {
            valueType: Const::LIST,
            values: %w(not_friend friend requested pending)
          }
        },
        friendship_url: { type: Const::STRING, required: true },
        country: { type: Const::STRING },
        city: { type: Const::STRING },
        training_for: { type: Const::STRING },
        pymk_reason: { type: Const::STRING }
      }
    }
  end

  def user_consent_model
    {
      :id => Const::USER_CONSENT,
      :properties => {
        :id => {
          :type => Const::INT,
          :required => true
        },
        :consent_type => {
          :type => Const::STRING,
          :required => true
        },
        :scope => {
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
        },
        :daily_steps_target => {
          :type => Const::INT,
          :required => true
        },
        :sleep_target => {
          :type => Const::INT,
          :description => "Daily sleep target in minutes",
          :required => true
        },
        :linked_with_mixpanel => {
          :type => Const::BOOLEAN,
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
          :type => 'int,float,string,boolean',
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
        },
        creatable: {
          required: true,
          type: Const::BOOLEAN,
          :description => "Indicates that user can create this kind of entry. Value is 'false' for Polar, FitBit, ActiveDay (wearable devices)."
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
          :type => Const::SPORT,
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
        },
        :mode_values => {
          :type => Const::MODE_VALUES,
          :description => 'Mode sport param values for this sport based on recent training log entries'
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
        :personal_program => {
          :type => Const::COMPACT_PERSONAL_PROGRAM
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
        :latest_comments => {
          :items => {
            :$ref => Const::COMMENT
          },
          :type => Const::ARRAY
        },
        :place => {
          :type => Const::PLACE
        },
        :media => {
          :items => {
            :$ref => Const::MEDIA
          },
          :type => Const::ARRAY
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

  def video_model
    {
      :id => Const::VIDEO,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :provider => {
          :type => Const::STRING,
          :description => "youtube or vimeo",
          :required => true
        },
        :title => {
          :type => Const::STRING,
          :required => true
        },
        :description => {
          :type => Const::STRING
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :video_id => {
          :type => Const::STRING,
          :description => "Provider specific identifier of the video",
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
        :latest_comments => {
          :items => {
            :$ref => Const::COMMENT
          },
          :type => Const::ARRAY
        },
        :media => {
          :items => {
            :$ref => Const::MEDIA
          },
          :type => Const::ARRAY
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
        :latest_comments => {
          :items => {
            :$ref => Const::COMMENT
          },
          :type => Const::ARRAY
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
        :latest_comments => {
          :items => {
            :$ref => Const::COMMENT
          },
          :type => Const::ARRAY
        },
        :media => {
          :items => {
            :$ref => Const::MEDIA
          },
          :type => Const::ARRAY
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
        :latest_comments => {
          :items => {
            :$ref => Const::COMMENT
          },
          :type => Const::ARRAY
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
        },
        :organisation => {
          :type => Const::ORGANISATION
        },
        :description => {
          :type => Const::STRING
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
        :latest_comments => {
          :items => {
            :$ref => Const::COMMENT
          },
          :type => Const::ARRAY
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
        :image_url => {
          :type => Const::STRING,
          :description => "Example https://example.com/path/to/image/{size}.png, {size} - possible size of image(could be 192, 480, 1080)"
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
        :id => {
          :type => Const::LONG,
          :required => true,
          :description => "Identifier of the conversation"
        },
        :group => {
          :type => Const::GROUP,
          :required => false,
          :description => "The team this conversation belongs to. Only present for team conversations"
        },
        :user_id => {
          :type => Const::LONG,
          :required => false
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

  def library_model
    {
      id: Const::LIBRARY,
      properties: {
        id: { type: Const::LONG, required: true },
        name: { type: Const::STRING, required: true },
        url: { type: Const::STRING, required: true }
      }
    }
  end

  def library_folder_model
    {
      id: Const::LIBRARY_FOLDER,
      properties: {
        id: { type: Const::LONG, required: true },
        name: { type: Const::STRING, required: true },
        url: { type: Const::STRING, required: true },
        program_count: { type: Const::INT, required: true },
        survey_count: { type: Const::INT, required: true },
        video_count: { type: Const::INT, required: true },
        exercise_count: { type: Const::INT, required: true }
      }
    }
  end

  def library_item_types
    [
      Const::PROGRAM,
      Const::SURVEY,
      Const::VIDEO,
      Const::DOCUMENT,
      Const::TRAINING_LOG,
      Const::WELLNESS_ENTRY
    ]
  end

  def library_item_model
    {
      id: Const::LIBRARY_ITEM,
      properties: {
        id: { type: Const::LONG, required: true },
        url: {
          type: Const::STRING,
          description: "Full item URL, including folder part",
          required: true
        },
        canonical_url: {
          type: Const::STRING,
          description: "Item URL without folder part",
          required: true
        },
        folder_id: {
          type: Const::LONG,
          description: "Identifier of the folder the item is contained in",
          required: true
        },
        name: { type: Const::STRING, required: true },
        description: { type: Const::TEXT },
        kind: {
          type: Const::STRING,
          required: true,
          allowableValues: { valueType: Const::LIST, values: library_item_types }
        },
        entry: { type: library_item_types.join(" | "), required: true }
      }
    }
  end

  def document_model
    {
      id: Const::DOCUMENT,
      properties: {
        name: { type: Const::STRING, required: true },
        attachment_url: { type: Const::STRING, required: true },
        description: { type: Const::TEXT }
      }
    }
  end

  def invite_model
    {
      :id => Const::INVITE,
      :properties => {
        :user => {
          :type => Const::COMPACT_USER,
          :required => true
        },
        :status => {
          :type => Const::STRING,
          :required => true,
          :allowableValues => {
            :valueType => Const::LIST,
            :values => ['new', 'existing']
          }
        },
        :email => {
          :type => Const::STRING,
          :required => true,
          :description => "Email associated with this invite."
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
        :organisation => {
          :type => Const::ORGANISATION,
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
        :latest_comments => {
          :items => {
            :$ref => Const::COMMENT
          },
          :type => Const::ARRAY
        },
        :media => {
          :items => {
            :$ref => Const::MEDIA
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

  def daily_statistic_model
    {
      :id => Const::DAILY_STATISTIC,
      :properties => {
        :date => {
          :type => Const::STRING,
          :required => true,
          :description => "Date of the daily statistic, e.g. \"2015-09-18\""
        },
        :distance => {
          :type => Const::FLOAT,
          :description => "Distance covered in kilometers or miles (depending on user settings)"
        },
        :exercise_count => {
          :type => Const::INT
        },
        :exercise_duration => {
          :type => Const::INT,
          :description => "Combined exercise duration in minutes"
        },
        :floors => {
          :type => Const::INT
        },
        :sick_day => {
          :type => Const::BOOLEAN
        },
        :sleep => {
          :type => Const::INT,
          :description => "Sleep in minutes"
        },
        :steps => {
          :type => Const::INT
        },
        :weight => {
          :type => Const::FLOAT,
          :description => "Weight in kilograms or pounds (depending on user settings)"
        },
        :wellness_entry_count => {
          :type => Const::INT
        },
        :resting_heart_rate => {
          :type => Const::INT
        }
      }
    }
  end

  def monthly_statistic_model
    {
      :id => Const::MONTHLY_STATISTIC,
      :properties => {
        :month => {
          :type => Const::STRING,
          :required => true,
          :description => "Month of the monthly statistic, e.g. \"2015-10\""
        },
        :weight => {
          :type => Const::FLOAT,
          :description => "Weight in kilograms or pounds (depending on user settings)"
        }
      }
    }
  end

  def weekly_target_model
    {
      :id => Const::WEEKLY_TARGET,
      :properties => {
        :week => {
          :type => Const::STRING,
          :required => true,
          :description => "Year and week of the target, e.g. \"2015-38\""
        },
        :target_amount => {
          :type => Const::FLOAT,
        },
        :real_amount => {
          :type => Const::FLOAT
        },
        :unit => {
          :type => Const::STRING,
          :description => "Type of the weekly target metric",
          :allowableValues => {
            :valueType => Const::LIST,
            :values => %w(hours exercises distance steps wellness_entries)
          }
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
        :notesable => {
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
        :personal_program => {
          :type => Const::COMPACT_PERSONAL_PROGRAM
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
        :latest_comments => {
          :items => {
            :$ref => Const::COMMENT
          },
          :type => Const::ARRAY
        },
        :media => {
          :items => {
            :$ref => Const::MEDIA
          },
          :type => Const::ARRAY
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
        :latest_comments => {
          :items => {
            :$ref => Const::COMMENT
          },
          :type => Const::ARRAY
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

  def compact_personal_program_model
    {
      :id => Const::COMPACT_PERSONAL_PROGRAM,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :date => {
          :type => Const::DATE,
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
      id: Const::SURVEY,
      properties: {
        id: { type: Const::LONG, required: true },
        banner_image_url: {
          type: Const::STRING,
          required: false,
          description: "Banner image to use with the survey, if any. There is only single size that the client must scale appropriately."
        },
        title: { type: Const::STRING, required: true },
        description: { type: Const::TEXT },
        icon_url: { type: Const::STRING, required: true, description: common_icon_description },
        planned_icon_url: { type: Const::STRING, required: true, description: common_icon_description },
        url: { type: Const::STRING, required: true },
        recurring: { type: Const::BOOLEAN, required: true },
        questions: { items: { :$ref => Const::QUESTION }, type: Const::ARRAY, required: true },
        graph_type: {
          type: Const::STRING,
          allowableValues: { valueType: Const::LIST, values: ["bar"] },
          required: false,
          description: "Type of historical comparison to show for this survey. Unsupported graph types must be ignored."
        },
        graph_options: {
          type: Const::INT,
          required: false,
          description: "Graph type specific options. For graph type 'bar' this value indicates how many past surveys should be included in the comparison."
        },
        report_key: { type: Const::STRING },
      }
    }
  end

  def compact_survey_model
    {
      id: Const::COMPACT_SURVEY,
      properties: {
        id: { type: Const::LONG, required: true },
        banner_image_url: {
          type: Const::STRING,
          required: false,
          description: "Banner image to use with the survey, if any. There is only single size that the client must scale appropriately."
        },
        title: { type: Const::STRING, required: true },
        description: { type: Const::TEXT },
        icon_url: { type: Const::STRING, required: true, description: common_icon_description },
        planned_icon_url: { type: Const::STRING, required: true, description: common_icon_description },
        url: { type: Const::STRING, required: true },
        recurring: { type: Const::BOOLEAN, required: true }
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
        :category => {
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
        :subtype => {
          :allowableValues => {
            :valueType => Const::LIST,
            :values => ["slider"]
          },
          :type => Const::STRING,
          :required => false
        },
        :notable => {
          :type => Const::BOOLEAN,
          :required => true
        },
        :global_comparison_type => {
          :type => Const::STRING,
          :allowableValues => {
            :valueType => Const::LIST,
            :values => [
              "mean"
            ]
          },
          :required => false,
          :description => "The algorithm to apply to answer option's answer percentage to calculate reference number to compare user's result to. Unsupported types must be ignored."
        },
        :show_historical_comparison => {
          :type => Const::BOOLEAN,
          :required => true,
          :description => "Whether or not this question should be included in graph comparing current answer with old answers."
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
        },
        :answer_percentage => {
          :type => Const::FLOAT,
          :required => true,
          :description => "The percentage (0.0-100.0) of answers where this particular option was chosen."
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
        :complete => {
          :type => Const::BOOLEAN,
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
        :user_score => {
          :type => Const::INT,
          :required => true,
          :description => "Stable score the user got from the survey (bigger number is better)."
        },
        :maximum_score => {
          :type => Const::INT,
          :required => true,
          :description => "The maximum score possible to obtain for this survey."
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
        :latest_comments => {
          :items => {
            :$ref => Const::COMMENT
          },
          :type => Const::ARRAY
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
        },
        :personal_program => {
          :type => Const::COMPACT_PERSONAL_PROGRAM
        },
        sticky_days: { type: Const::INT, required: true },
        reminder_title: { type: Const::STRING },
        reminder_title_short: { type: Const::STRING },
        reminder_description: { type: Const::TEXT },
        reminder_description_short: { type: Const::TEXT },
        reminder_footer: { type: Const::TEXT },
        reminder_button: { type: Const::STRING },
        organisation_survey: { type: Const::ORGANISATION_SURVEY }
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
          :required => true,
          :allowableValues => {
            :valueType => Const::LIST,
            :values => %w(commented_on created_megaphone program_reminder sent_message requested_friendship cheered_for popular_entry)
          }
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
        },
        :conversation => {
          :type => Const::CONVERSATION,
          :required => false,
          :description => "Conversation associated with this notification. Only present if action is 'sent_message'"
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
          :type => Const::TEXT,
          :required => true
        },
        :icon_url => {
          :type => Const::STRING,
          :description => extra_model_icon_description,
          :required => true
        },
        :non_square_icon_url => {
          :type => Const::STRING,
          :description => "(A possibly) non-square icon that should be used with surveys that have banner image. {height} variable in the URL needs to be replaced with desired height, width is undefined and depends on icon. Accepted height values are 40, 60, 80, 120 and 160.",
          :required => false
        },
        :program_ids  => {
          :items => { :$ref => Const::LONG },
          :type => Const::ARRAY,
          :required => true
        },
        title: { type: Const::STRING },
        summary: { type: Const::TEXT }
      }
    }
  end

  def mode_values_model
    {
      :id => Const::MODE_VALUES,
      :properties => {
        :duration => {
          :type => Const::STRING
        },
        :distance => {
          :type => Const::STRING
        },
        :steps => {
          :type => Const::STRING
        }
      }
    }
  end

  def media_model
    {
      :id => Const::MEDIA,
      :properties => {
        :id => {
          :type => Const::LONG,
          :required => true
        },
        :url => {
          :type => Const::STRING,
          :required => true
        },
        :type => {
          :type => Const::STRING,
          :required => true,
          :allowableValues => {
            :valueType => Const::LIST,
            :values => %w(image)
          }
        },
        :image_url => {
          :type => Const::STRING,
          :description => "Example https://example.com/path/to/image/{size}.png, {size} - possible size of image(could be 192, 480, 1080)",
          :required => true
        },
        :content_url => {
          :type => Const::STRING,
          :description => "URL on original file",
          :required => true
        },
        :notes => {
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

  def organisation_model
    {
      id: Const::ORGANISATION,
      properties: {
        id: { type: Const::LONG, required: true },
        :url => { :type => Const::STRING, :required => true },
        name: { type: Const::STRING, required: true },
        creatable_megaphones: { type: Const::BOOLEAN, required: true }
      }
    }
  end

  def group_model
    {
      id: Const::GROUP,
      properties: {
        access_type: {
          type: Const::STRING,
          description: "Defines whether the team can be joined by anyone, membership needs to be requested, or the team is invite only",
          allowableValues: {
            valueType: Const::LIST,
            values: %w(public requested private)
          },
          required: true
        },
        avatar_url: {
          type: Const::STRING,
          description: common_icon_description,
          required: false
        },
        description: {
          type: Const::STRING,
          required: false
        },
        id: {
          type: Const::LONG,
          required: true
        },
        managed: {
          type: Const::BOOLEAN,
          description: "True for teams whose memberships are managed by administrators, false for teams that can be freely joined and left by users themselves",
          required: true
        },
        member_count: {
          type: Const::INT,
          description: "Number of accepted members in the group",
          required: true
        },
        name: {
          type: Const::STRING,
          required: true
        },
        official: {
          type: Const::BOOLEAN,
          description: "True for teams greated by organisation administrator, false for user created teams",
          required: true
        },
        :organisation => {
          :type => Const::ORGANISATION,
          :required => true
        }
      }
    }
  end

  def team_membership_model
    {
      id: Const::TEAM_MEMBERSHIP,
      properties: {
        id: {
          type: Const::LONG,
          required: true
        },
        status: {
          type: Const::STRING,
          description: "Indicates whether the team membership has been accepted or not",
          required: true,
          allowableValues: {
            valueType: Const::LIST,
            values: %w(accepted pending)
          }
        },
        team_id: {
          type: Const::LONG,
          description: "Identifier of the team this membership is associated with",
          required: true
        },
        team: {
          type: Const::GROUP,
          description: "Details of the team this membership is associated with",
          required: true
        }
      }
    }
  end

  def request_model
    {
      id: Const::REQUEST,
      properties: {
        id: { type: Const::LONG, required: true },
        url: { type: Const::STRING, required: true },
        type: {
          type: Const::STRING,
          required: true,
          allowableValues: {
            valueType: Const::LIST,
            values: %w(group_invite group_join friendship coach_request, org_invite)
          }
        },
        status: {
          type: Const::STRING,
          required: true,
          allowableValues: { valueType: Const::LIST, values: %w(open accepted rejected) }
        },
        title: { type: Const::STRING, required: true },
        description: { type: Const::STRING },
        extra_note: { type: Const::STRING },
        actor: { type: Const::COMPACT_USER, required: true },
        target: { type: [Const::COMPACT_USER, Const::GROUP, Const::ORGANISATION].join(' | '), required: true },
        actions: { items: { :$ref => Const::REQUEST_ACTION }, type: Const::ARRAY }
      }
    }
  end

  def request_action_model
    {
      id: Const::REQUEST_ACTION,
      properties: {
        title: { type: Const::STRING, required: true },
        url: { type: Const::STRING, required: true },
        type: {
          type: Const::STRING,
          required: true,
          allowableValues: { valueType: Const::LIST, values: %w(accept reject) }
        }
      }
    }
  end

  def wearable_model
    {
      :id => Const::WEARABLE,
      :properties => {
        :confirm_url => {
          :type => Const::STRING,
          :description => "URL where the user should be redirected after requesting connection. Only applicable when connection_mechanism is 'email'."
        },
        :connection_mechanism => {
          :type => Const::STRING,
          :description => "This value is 'oauth' for most services, indicating regular OAuth flow. For Polar the value is 'email'.",
          :required => true,
          :allowableValues => {
            :valueType => Const::LIST,
            :values => %w(oauth email)
          }
        },
        :disconnectable => {
          :type => Const::BOOLEAN,
          :description => "Tells whether or not the service can be disconnected via API. If false user needs to disconnect from the wearable provider side.",
          :required => true
        },
        :display_name => {
          :type => Const::STRING,
          :description => "Display name of the service",
          :required => true
        },
        :email => {
          :type => Const::STRING,
          :description => "Email associated with this service, if any. Only applicable when connection_mechanism is 'email'."
        },
        :logo_url => {
          :type => Const::STRING,
          :description => "URL for service logo (png). No size patterns are supported and the logo size is always 160x160 pixels.",
          :required => true
        },
        :oauth_redirect_url_pattern => {
          :type => Const::STRING,
          :description => "Regular expression defining the URL where browser will be redirected at the end of the OAuth flow."
        },
        :oauth_url => {
          :type => Const::STRING,
          :description => "URL where user should be taken to start the OAuth flow. Only returned when explicitly requested."
        },
        :provider => {
          :type => Const::STRING,
          :description => "Name of the wearable service provider.",
          :required => true
        },
        :status => {
          :type => Const::STRING,
          :description => "Current connection status for this service.",
          :required => true,
          :allowableValues => {
            :valueType => Const::LIST,
            :values => %w(disconnected requested connected)
          }
        },
      }
    }
  end

  def point_system_model
    {
      id: Const::POINT_SYSTEM,
      properties: {
        id: { type: Const::INT, required: true },
        title: { type: Const::STRING, required: true },
        description: { type: Const::TEXT, required: true },
        image_url: {
          type: Const::STRING,
          required: true,
          description: "Example https://example.com/path/to/image?size={resolution}, where {resolution} in (640x344, 750x344, 1125x516, 1242x516)"
        },
        rules_image_url: {
          type: Const::STRING,
          required: true,
          description: "Example https://example.com/path/to/image?width={width}, where {width} in (640, 750, 1125, 1242)"
        },
        levels_title: { type: Const::STRING, required: true },
        levels: { items: { "$ref": Const::POINT_SYSTEM_LEVEL }, type: Const::ARRAY, required: true },
        rules_title: { type: Const::STRING, required: true },
        rules: { items: { "$ref": Const::POINT_SYSTEM_RULE }, type: Const::ARRAY, required: true }
      }
    }
  end

  def point_system_level_model
    {
      id: Const::POINT_SYSTEM_LEVEL,
      properties: {
        title: { type: Const::STRING, required: true },
        name: { type: Const::STRING, required: true },
        points: { type: Const::STRING, required: true }
      }
    }
  end

  def point_system_rule_model
    {
      id: Const::POINT_SYSTEM_RULE,
      properties: {
        title: { type: Const::STRING, required: true },
        points: { type: Const::STRING, required: true }
      }
    }
  end

  def organisation_survey_model
    {
      id: Const::ORGANISATION_SURVEY,
      properties: {
        title: { type: Const::STRING },
        started_at: { type: Const::DATE_TIME, required: true },
        ends_on: { type: Const::DATE, required: true }
      }
    }
  end

  def weekly_summary_model
    {
      id: Const::WEEKLY_SUMMARY,
      properties: {
        id: { type: Const::INT, required: true },
        url: { type: Const::STRING, required: true },
        user: { type: Const::COMPACT_USER, required: true },
        created_at: { type: Const::DATE_TIME, required: true },
        start_date: { type: Const::DATE, required: true },
        end_date: { type: Const::DATE, required: true },
        title: { type: Const::STRING, required: true },
        private: { type: Const::BOOLEAN, required: true },
        removable: { type: Const::BOOLEAN, required: true },
        editable: { type: Const::BOOLEAN, required: true },
        cheerable: { type: Const::BOOLEAN, required: true },
        commentable: { type: Const::BOOLEAN, required: true },
        highlight: { type: Const::STRING },
        breakdown: { items: { "$ref": Const::WEEKLY_SUMMARY_BREAKDOWN }, type: Const::ARRAY, required: true },
        point_systems: { items: { "$ref": Const::WEEKLY_POINT_SYSTEM_SUMMARY }, type: Const::ARRAY },
      }
    }
  end

  def weekly_summary_breakdown_model
    {
      id: Const::WEEKLY_SUMMARY_BREAKDOWN,
      properties: {
        kind: {
          type: Const::STRING,
          required: true,
          allowableValues: { valueType: Const::LIST, values: %w[exercises steps sleep weight] }
        },
        title: { type: Const::STRING, required: true },
        description: { type: Const::STRING },
        result: { type: Const::STRING }
      }
    }
  end

  def compact_weekly_point_system_summary_model
    {
      id: Const::COMPACT_WEEKLY_POINT_SYSTEM_SUMMARY,
      properties: {
        start_date: { type: Const::DATE, required: true },
        end_date: { type: Const::DATE, required: true },
        points_total: { type: Const::INT, required: true },
        points_earned: { type: Const::INT, required: true },
        points_expired: { type: Const::INT, required: true }
      }
    }
  end

  def weekly_point_system_summary_breakdown_model
    {
      id: Const::WEEKLY_POINT_SYSTEM_SUMMARY_BREAKDOWN,
      properties: {
        title: { type: Const::STRING, required: true },
        points: { type: Const::STRING, required: true },
        details: { type: Const::STRING }
      }
    }
  end


  def weekly_point_system_summary_model
    {
      id: Const::WEEKLY_POINT_SYSTEM_SUMMARY,
      properties: {
        id: { type: Const::INT, required: true },
        url: { type: Const::STRING, required: true },
        title: { type: Const::STRING, required: true },
        start_date: { type: Const::DATE, required: true },
        end_date: { type: Const::DATE, required: true },
        points_total: { type: Const::INT, required: true },
        points_earned: { type: Const::INT, required: true },
        points_expired: { type: Const::INT, required: true },
        points_balance: { type: Const::STRING, required: true },
        points_history: { items: { "$ref": Const::COMPACT_WEEKLY_POINT_SYSTEM_SUMMARY }, type: Const::ARRAY },
        points_breakdown: { items: { "$ref": Const::WEEKLY_POINT_SYSTEM_SUMMARY_BREAKDOWN }, type: Const::ARRAY,
                            required: true},
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

  def model_dependencies
    {
      Const::ANSWER => [Const::QUESTION, Const::QUESTION_OPTION],
      Const::CHEER => [Const::CHEER_TYPE, Const::COMPACT_USER],
      Const::CHEER_TYPE => [],
      Const::COMMENT => [Const::COMPACT_USER],
      Const::COMPACT_PERSONAL_PROGRAM => [],
      Const::COMPACT_SPORT => [],
      Const::COMPACT_SURVEY => [],
      Const::COMPACT_USER => [],
      Const::CONVERSATION => [],
      Const::DAILY_STATISTIC => [],
      Const::DOCUMENT => [],
      Const::FEED => [],
      Const::FREE_ENTRY => [Const::COMPACT_USER, Const::CHEER, Const::COMMENT, Const::MEDIA],
      Const::GROUP => [Const::ORGANISATION],
      Const::INVITE => [Const::COMPACT_USER],
      Const::ITEM => [Const::COMPACT_USER],
      Const::LIBRARY => [],
      Const::LIBRARY_FOLDER => [],
      Const::LIBRARY_ITEM => [],
      Const::MEDAL => [Const::COMPACT_USER, Const::CHEER, Const::COMMENT],
      Const::MEGAPHONE => [Const::COMPACT_USER, Const::CHEER, Const::COMMENT, Const::ORGANISATION, Const::MEDIA],
      Const::MESSAGE => [Const::COMPACT_USER],
      Const::MODE_VALUES => [],
      Const::MONTHLY_STATISTIC => [],
      Const::NOTIFICATION => [Const::COMPACT_USER, Const::NOTIFICATION_OBJECT],
      Const::NOTIFICATION_OBJECT => [],
      Const::ORGANISATION => [],
      Const::ORGANISATION_SURVEY => [],
      Const::PERSONAL_PROGRAM => [Const::COMPACT_USER, Const::PROGRAM, Const::CHEER, Const::COMMENT],
      Const::PLACE => [],
      Const::PLANNED_SURVEY => [Const::SURVEY, Const::COMPACT_PERSONAL_PROGRAM, Const::ORGANISATION_SURVEY],
      Const::POINT_SYSTEM => [Const::POINT_SYSTEM_LEVEL, Const::POINT_SYSTEM_RULE],
      Const::POINT_SYSTEM_LEVEL => [],
      Const::POINT_SYSTEM_RULE => [],
      Const::PROGRAM => [],
      Const::REQUEST => [Const::COMPACT_USER, Const::GROUP, Const::REQUEST_ACTION],
      Const::REQUEST_ACTION => [],
      Const::QUESTION => [Const::QUESTION_OPTION],
      Const::SICK_DAY => [Const::COMPACT_USER, Const::CHEER, Const::COMMENT],
      Const::SPORT => [Const::SPORT_PARAM],
      Const::SPORT_PARAM => [],
      Const::SPORT_PARAM_VALUE => [Const::SPORT_PARAM],
      Const::SURVEY => [Const::QUESTION],
      Const::SURVEY_RESULT => [Const::ANSWER, Const::COMPACT_SURVEY, Const::SURVEY_FEEDBACK, Const::COMPACT_USER, Const::CHEER, Const::COMMENT],
      Const::TAG => [],
      Const::TEAM_MEMBERSHIP => [Const::GROUP],
      Const::TOP_SPORT => [Const::MODE_VALUES, Const::SPORT],
      Const::TRAINING_GOAL => [Const::COMPACT_USER],
      Const::TRAINING_LOG => [ Const::COMPACT_SPORT, Const::COMPACT_USER, Const::PLACE, Const::SPORT_PARAM_VALUE,
                               Const::TAG, Const::CHEER, Const::COMMENT, Const::MEDIA, Const::COMPACT_PERSONAL_PROGRAM],
      Const::USER => [],
      Const::USER_CONSENT => [],
      Const::VIDEO => [],
      Const::WEARABLE => [],
      Const::WEEKLY_POINT_SYSTEM_SUMMARY => [Const::COMPACT_WEEKLY_POINT_SYSTEM_SUMMARY,
                                             Const::WEEKLY_POINT_SYSTEM_SUMMARY_BREAKDOWN],
      Const::WEEKLY_SUMMARY => [Const::COMPACT_USER, Const::WEEKLY_SUMMARY_BREAKDOWN,
                                Const::WEEKLY_POINT_SYSTEM_SUMMARY],
      Const::WEEKLY_SUMMARY_BREAKDOWN => [],
      Const::WEEKLY_TARGET => [],
      Const::WEIGHT => [Const::COMPACT_USER, Const::CHEER, Const::COMMENT, Const::MEDIA],
      Const::WELLNESS_ENTRY => [Const::COMPACT_USER, Const::WELLNESS_TYPE, Const::WELLNESS_PARAM_VALUE, Const::CHEER, Const::COMMENT, Const::MEDIA, Const::COMPACT_PERSONAL_PROGRAM],
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
     where '{size}' value can be from this list ['30x30', '34x34', '48x48', '64x64, '72x72', '80x80', '96x96', '120x120', '144x144', '192x192']. Avatars also have sizes '60x60', '160x160' and '320x320'"
  end

  def extra_model_icon_description
    "Example https://example.com/path/to/image/{size}.png,
     {size} - possible size of image(could be 48x48, 64x64, 72x72, 80x80, 96x96, 120x120, 144x144, 192x192)"
  end

end
