# frozen_string_literal: true

# Image Generator class
# frozen_string_literal: true

require_relative 'base_generator'
require_relative 'gpt_client'

# Article Generator class
class ImageGenerator < BaseGenerator
  def run
    puts 'Please provide an image prompt: '

    prompt = gets.chomp

    puts 'What resolution would you like? Options are 256, 512, 1024: (enter for 256)'

    size = gets.chomp

    puts 'Processing. This may take a minute...'

    response = client.image(prompt, size)
    puts 'Finished. Open the link to see the generated image.'
    puts response
  end
end

ImageGenerator.run
