# -*- encoding : utf-8 -*-

require 'time'

module BaseStub

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
  end

  module ClassMethods

    def all
      entries.map { |entry| new(entry) }
    end

    def find(id)
      entry = entries.detect { |f| f[:id] == id.to_i }
      new(entry) if entry
    end

  end

  module InstanceMethods

    def initialize(attributes)
      @attributes = attributes
    end

    def to_json
      to_hash.to_json
    end

    def id
      @attributes[:id]
    end

    def created_at
      @attributes[:created_at].utc.iso8601
    end

  end

end
