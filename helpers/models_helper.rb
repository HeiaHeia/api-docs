# -*- encoding: utf-8 -*-

module ModelsHelper

  def embedded_user_model
    {
      :id => "User",
      :properties => {
        :id => {
          :type => "long",
          :required => true
        },
        :first_name => {
          :type => "string"
        },
        :last_name => {
          :type => "string"
        },
        :avatar_url => {
          :type => "string",
          :required => true
        },
        :url => {
          :type => "string",
          :required => true
        }
      }
    }.to_json
  end

  def sport_param_model
    {
      :id => "SportParam",
      :properties => {
        :id => {
          :type => "string",
          :required => true
        },
        :name => {
          :type => "string",
          :required => true
        },
        :unit => {
          :type => "string",
          :required => true
        },
        :type => {
          :allowableValues => {
            :valueType => "LIST",
            :values => [
              "int",
              "float",
              "string"
            ]
          },
          :type => "string",
          :required => true
        },
        :value => {
          :type => "int,float,string",
          :required => true
        }
      }
    }.to_json
  end

end
