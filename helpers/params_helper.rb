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

  def param_notes
    {
      :name => 'notes',
      :paramType => 'form',
      :dataType => Const::TEXT,
      :description => 'Informal notes for the entry.'
    }.to_json
  end

end
