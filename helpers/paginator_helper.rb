# -*- encoding: utf-8 -*-

require 'const'

module PaginatorHelper

  def param_page
    {
      :name => "page",
      :paramType => "query",
      :dataType => Const::BYTE,
      :defaultValue => 1
    }.to_json
  end

  def param_per_page
    {
      :name => "per_page",
      :description => "Per page between 1 and 100",
      :paramType => "query",
      :dataType => Const::BYTE,
      :defaultValue => "20",
      :allowableValues => {
        :valueType => Const::RANGE,
        :min => 1,
        :max => 100
      }
    }.to_json
  end

end
