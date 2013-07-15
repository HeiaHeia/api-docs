# -*- encoding: utf-8 -*-

module ErrorHelper

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
  ]

  def responses(*codes)
    RESPONSES.find_all { |r| codes.include?(r[:code]) }.to_json
  end

end
