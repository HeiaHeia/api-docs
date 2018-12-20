module Const

  BASE_PATH = ENV['RACK_ENV'] == 'production' ? 'https://api.heiaheia.com/v2' : 'http://api.hh.dev:3000/v2'

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
  COMPACT_PERSONAL_PROGRAM = 'CompactPersonalProgram'.freeze
  COMPACT_USER = 'CompactUser'.freeze
  COMPACT_SURVEY = 'CompactSurvey'.freeze
  COMPACT_WEEKLY_POINT_SYSTEM_SUMMARY = 'CompactWeeklyPointSystemSummary'.freeze
  CONVERSATION = 'Conversation'.freeze
  DOCUMENT = 'Document'.freeze
  GROUP = 'Group'.freeze
  DAILY_STATISTIC = 'DailyStatistic'.freeze
  FEED = 'Feed'.freeze
  SURVEY_FEEDBACK = 'SurveyFeedback'.freeze
  FREE_ENTRY = 'FreeEntry'.freeze
  INVITE = 'Invite'.freeze
  ITEM = 'Item'.freeze
  LIBRARY = 'Library'.freeze
  LIBRARY_FOLDER = 'LibraryFolder'.freeze
  LIBRARY_ITEM = 'LibraryItem'.freeze
  MEDAL = 'Medal'.freeze
  MEDIA = 'Media'.freeze
  MEGAPHONE = 'Megaphone'.freeze
  MESSAGE = 'Message'.freeze
  MODE_VALUES = 'ModeValues'.freeze
  MONTHLY_STATISTIC = 'MonthlyStatistic'.freeze
  NOTIFICATION = 'Notification'.freeze
  NOTIFICATION_OBJECT = 'NotificationObject'.freeze
  ORGANISATION = 'Organisation'.freeze
  ORGANISATION_SURVEY = 'OrganisationSurvey'.freeze
  PERSONAL_PROGRAM = 'PersonalProgram'.freeze
  PLACE = 'Place'.freeze
  PLANNED_SURVEY = 'PlannedSurvey'.freeze
  POINT_SYSTEM = 'PointSystem'.freeze
  POINT_SYSTEM_LEVEL = 'PointSystemLevel'.freeze
  POINT_SYSTEM_RULE = 'PointSystemRule'.freeze
  PROGRAM = 'Program'.freeze
  REQUEST = 'Request'.freeze
  REQUEST_ACTION = 'RequestAction'.freeze
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
  TEAM_MEMBERSHIP = 'TeamMembership'.freeze
  TEXT_ENTRY = 'TextEntry'.freeze
  TOP_SPORT = 'TopSport'.freeze
  TRAINING_GOAL = 'TrainingGoal'.freeze
  TRAINING_LOG = 'TrainingLog'.freeze
  USER = 'User'.freeze
  USER_CONSENT = 'UserConsent'.freeze
  VIDEO = 'Video'.freeze
  WEARABLE = 'Wearable'.freeze
  WEEKLY_POINT_SYSTEM_SUMMARY = 'WeeklyPointSystemSummary'.freeze
  WEEKLY_POINT_SYSTEM_SUMMARY_BREAKDOWN = 'WeeklyPointSystemSummaryBreakdown'.freeze
  WEEKLY_SUMMARY = 'WeeklySummary'.freeze
  WEEKLY_SUMMARY_BREAKDOWN = 'WeeklySummaryBreakdown'.freeze
  WEEKLY_TARGET = 'WeeklyTarget'.freeze
  WEIGHT = 'Weight'.freeze
  WELLNESS_ENTRY = 'WellnessEntry'.freeze
  WELLNESS_PARAM = 'WellnessParam'.freeze
  WELLNESS_PARAM_OPTION = 'WellnessParamOption'.freeze
  WELLNESS_PARAM_VALUE = 'WellnessParamValue'.freeze
  WELLNESS_TYPE = 'WellnessType'.freeze

  PRIVACIES = ['all_users', 'friends', 'friends_and_colleagues'].freeze

end
