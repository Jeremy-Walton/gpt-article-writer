# frozen_string_literal: true

require_relative 'gpt_client'

# Base Generator class for interacting with the OpenAI API
class BaseGenerator
  attr_reader :client

  def self.run
    new.run
  end

  def initialize
    @client = GPTClient.new
  end

  def run
    raise NotImplementedError, 'Subclass should override'
  end
end
