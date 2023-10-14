# frozen_string_literal: true

require_relative 'env'
require 'openai'

OpenAI.configure do |config|
  config.access_token = ENV.fetch('OPENAI_ACCESS_TOKEN')
  config.organization_id = ENV.fetch('OPENAI_ORGANIZATION_ID') # Optional
  config.request_timeout = 240 # Optional
end

# Class for interacting with the OpenAI API
class GPTClient
  MODEL = 'gpt-3.5-turbo'

  IMAGE_RESOLUTIONS = {
    '256': '256x256',
    '512': '512x512',
    '1024': '1024x1024'
  }.freeze

  attr_reader :client

  def initialize
    @client = OpenAI::Client.new
  end

  def text(prompt)
    response = client.chat(
      parameters: {
        model: MODEL,
        messages: [{ role: 'user', content: prompt }],
        temperature: 0.7
      }
    )
    response.dig('choices', 0, 'message', 'content')
  end

  def image(prompt, resolution)
    size = IMAGE_RESOLUTIONS[resolution.to_sym]

    if size.nil?
      puts 'Invalid resolution. Defaulted to 256.'
      size = IMAGE_RESOLUTIONS['256'.to_sym]
    end

    response = client.images.generate(
      parameters: { prompt: prompt, size: size }
    )
    response.dig('data', 0, 'url')
  end
end
