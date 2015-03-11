# -*- encoding: utf-8 -*-

require 'const'

module ParamsHelper

  def param_page
    {
      :name => 'page',
      :paramType => 'query',
      :dataType => Const::BYTE,
      :defaultValue => 1
    }.to_json
  end

  def param_per_page
    {
      :name => 'per_page',
      :description => "Per page between 1 and 100",
      :paramType => 'query',
      :dataType => Const::BYTE,
      :defaultValue => 20,
      :allowableValues => {
        :valueType => Const::RANGE,
        :min => 1,
        :max => 100
      }
    }.to_json
  end

  def param_year
    {
      :name => 'year',
      :description => "Gets list of entries for given year. Be default it's current year.",
      :paramType => 'query',
      :dataType => Const::INT,
      :defaultValue => Time.now.year
    }.to_json
  end

  def param_date(options={})
    {
      :name => 'date',
      :description => "Date of the entry as “YYYY-MM-DD”. Example “2010-04-23”",
      :paramType => 'form',
      :required => options.fetch(:required, false),
      :dataType => Const::DATE
    }.to_json
  end

  def param_required_date
    param_date(:required => true)
  end

  def param_user_id
    {
      :name => 'user_id',
      :paramType => 'path',
      :required => true,
      :dataType => Const::LONG
    }.to_json
  end

  def param_survey_id
    {
      :name => 'survey_id',
      :paramType => 'path',
      :required => true,
      :dataType => Const::LONG
    }.to_json
  end

  def param_program_id
    {
      :name => 'program_id',
      :paramType => 'form',
      :required => true,
      :dataType => Const::LONG
    }.to_json
  end

  def param_training_log_status
    {
      :name => 'status',
      :paramType => 'query',
      :description => 'Status values that need to be considered for filter',
      :required => true,
      :dataType => Const::STRING,
      :defaultValue => 'regular',
      :allowableValues => {
        :valueType => 'LIST',
        :values => ['regular', 'planned', 'all']
      }
    }.to_json
  end

  alias_method :param_wellness_entry_status, :param_training_log_status

  def param_notes
    {
      :name => 'notes',
      :paramType => 'form',
      :dataType => Const::TEXT,
      :description => 'Informal notes for the entry.'
    }.to_json
  end

  def sport_param_values(key)
    {
      :name => "sport_param_values[#{key}]",
      :paramType => "form",
      :dataType => [Const::INT, Const::FLOAT, Const::STRING].join(', '),
      :description => "Depends on the sport."
    }.to_json
  end

  def wellness_param_values(key)
    {
      :name => "param_values[#{key}]",
      :paramType => "form",
      :dataType => [Const::INT, Const::FLOAT, Const::BOOLEAN, 'option_id', 'array[option_id]'].join(', ')
    }.to_json
  end

  def param_tags
    {
      :name => 'tags[]',
      :paramType => 'form',
      :dataType => Const::STRING
    }.to_json
  end

end
