# frozen_string_literal: true

require_relative 'env'
require 'openai'

OpenAI.configure do |config|
  config.access_token = ENV.fetch('OPENAI_ACCESS_TOKEN')
  config.organization_id = ENV.fetch('OPENAI_ORGANIZATION_ID') # Optional
  config.request_timeout = 240 # Optional
end

# Chatbot class
class ArticleWriter
  attr_reader :client, :folder

  def initialize
    @client = OpenAI::Client.new
    @folder = 'articles'
  end

  def call(topic)
    puts 'Processing. This may take a few minutes...'

    section_titles = section_titles(topic)
    article_keywords = article_keywords(topic)

    raw_article = generate_article(topic, section_titles, article_keywords)
    generate_html_article(raw_article)

    puts "Finished. Check the #{folder} folder for your article."

    raw_article
  end

  private

  def section_titles(topic)
    section_titles = chat("Please provide an outline for an article about #{topic}")

    puts 'Outline Generated'

    section_titles
  end

  def article_keywords(topic)
    article_keywords = chat("Please provide a list of related keywords for: #{topic}")

    puts 'Keywords Generated'

    article_keywords
  end

  def generate_article(topic, section_titles, article_keywords)
    raw_article = chat("Write an article about #{topic} using this oultine: #{section_titles} Be sure to include these keywords: #{article_keywords}")

    write_to_file('text', topic, raw_article)

    puts "Basic Article Generated. Check the #{folder}/text folder for your article."

    raw_article
  end

  def generate_html_article(raw_article)
    html_article = chat("Please format this article using HTML: #{raw_article}")

    # HTML
    puts 'HTML formatted Article Generated'

    write_to_file('html', topic, html_article)
    puts "HTML formatted Article Generated. Check the #{folder}/html folder for your article."

    html_article
  end

  def chat(content)
    response = client.chat(
      parameters: {
        model: 'gpt-3.5-turbo', # Required.
        messages: [{ role: 'user', content: content }], # Required.
        temperature: 0.7
      }
    )
    response.dig('choices', 0, 'message', 'content')
  end

  def write_to_file(subfolder, topic, contents)
    extension = subfolder == 'html' ? 'html' : 'txt'
    File.open("#{folder}/#{subfolder}/#{topic}.#{extension}", 'w') { |file| file.write(contents) }
  end
end

article_writer = ArticleWriter.new

puts 'Please provide a keyword phrase or topic for this article: '
topic = gets.chomp

response = article_writer.call(topic)

puts response
