module Const

  BASE_PATH = ENV['RACK_ENV'] == 'production' ? 'https://api.heiaheia.com/v3' : 'http://api.hh.dev:3000/v3'

  BASE_URL = ENV['RACK_ENV'] == 'production' ? 'https://api.heiaheia.com' : 'http://api.hh.dev:3000'

  BOOLEAN = 'boolean'.freeze

  BYTE = 'byte'.freeze
  INT = 'int'.freeze
  LONG = 'long'.freeze

  FLOAT = 'float'.freeze
  DOUBLE = 'double'.freeze

  STRING = 'string'.freeze
  TEXT = 'text'.freeze

  DATE = 'Date'.freeze
  DATE_TIME = 'DateTime'.freeze

  RANGE = 'RANGE'.freeze

  ARRAY = 'Array'.freeze
  LIST = 'LIST'.freeze

  BMI = 'bmi'.freeze
  CHECKBOX = 'checkbox'.freeze
  DROPDOWN = 'dropdown'.freeze
  RADIO = 'radio'.freeze
  STAR = 'star'.freeze

  ANSWER = 'Answer'.freeze
  CHEER = 'Cheer'.freeze
  CHEER_TYPE = 'CheerType'.freeze
  COMMENT = 'Comment'.freeze
  COMPACT_SPORT = 'CompactSport'.freeze
  COMPACT_SPORT_CATEGORY = 'CompactSportCategory'.freeze
  COMPACT_USER = 'CompactUser'.freeze
  COMPACT_SURVEY = 'CompactSurvey'.freeze
  CONVERSATION = 'Conversation'.freeze
  FEED = 'Feed'.freeze
  FREE_ENTRY = 'FreeEntry'.freeze
  ITEM = 'Item'.freeze
  MEDAL = 'Medal'.freeze
  MEGAPHONE = 'Megaphone'.freeze
  MESSAGE = 'Message'.freeze
  PERSONAL_PROGRAM = 'PersonalProgram'.freeze
  PLACE = 'Place'.freeze
  PLANNED_SURVEY = 'PlannedSurvey'.freeze
  PROGRAM = 'Program'.freeze
  QUESTION = 'Question'.freeze
  QUESTION_OPTION = 'QuestionOption'.freeze
  SICK_DAY = 'SickDay'.freeze
  SPORT = 'Sport'.freeze
  SPORT_CATEGORY = 'SportCategory'.freeze
  SPORT_PARAM = 'SportParam'.freeze
  SPORT_PARAM_VALUE = 'SportParamValue'.freeze
  SURVEY = 'Survey'.freeze
  SURVEY_RESULT = 'SurveyResult'.freeze
  TAG = 'Tag'.freeze
  TEXT_ENTRY = 'TextEntry'.freeze
  TOP_SPORT = 'TopSport'.freeze
  TRAINING_GOAL = 'TrainingGoal'.freeze
  TRAINING_LOG = 'TrainingLog'.freeze
  USER = 'User'.freeze
  WEIGHT = 'Weight'.freeze
  WELLNESS_ENTRY = 'WellnessEntry'.freeze
  WELLNESS_PARAM = 'WellnessParam'.freeze
  WELLNESS_PARAM_OPTION = 'WellnessParamOption'.freeze
  WELLNESS_PARAM_VALUE = 'WellnessParamValue'.freeze
  WELLNESS_TYPE = 'WellnessType'.freeze

  PRIVACIES = ['all_users', 'friends', 'friends_and_colleagues'].freeze

end
