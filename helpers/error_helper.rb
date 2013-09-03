# -*- encoding: utf-8 -*-

module ErrorHelper
  COMMON_RESPONSES = [
    {
      :code => 401,
      :reason => "Authentication credentials were missing or incorrect."
    },
    {
      :code => 403,
      :reason => "The request is understood, but it has been refused or access is not allowed. An accompanying error message will explain why."
    },
    {
      :code => 500,
      :reason => "Internal Server Error."
    },
    {
      :code => 502,
      :reason => "Bad Gateway. HeiaHeia is down or being upgraded."
    }
  ].freeze

  RESPONSES = [
    {
      :code => 400,
      :reason => "The request was invalid."
    },
    {
      :code => 403,
      :reason => "Forbidden"
    },
    {
      :code => 404,
      :reason => "Record not found"
    }
  ].freeze

  def responses(*codes)
    (RESPONSES.find_all { |r| codes.include?(r[:code]) } + COMMON_RESPONSES).
      sort_by {|response| response[:code] }.to_json
  end

end
