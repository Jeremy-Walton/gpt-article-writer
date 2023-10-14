# frozen_string_literal: true

require_relative 'base_generator'
require_relative 'gpt_client'

# Article Generator class
class ArticleGenerator < BaseGenerator
  attr_reader :folder

  def initialize
    super
    @folder = 'articles'
  end

  def run
    puts 'Please provide a keyword phrase or topic for this article: '

    topic = gets.chomp

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
    section_titles = client.text("Please provide an outline for an article about #{topic}")

    puts 'Outline Generated'

    section_titles
  end

  def article_keywords(topic)
    article_keywords = client.text("Please provide a list of related keywords for: #{topic}")

    puts 'Keywords Generated'

    article_keywords
  end

  def generate_article(topic, section_titles, article_keywords)
    raw_article = client.text("Write an article about #{topic} using this oultine: #{section_titles} Be sure to include these keywords: #{article_keywords}")

    write_to_file('text', topic, raw_article)

    puts "Basic Article Generated. Check the #{folder}/text folder for your article."

    raw_article
  end

  def generate_html_article(raw_article)
    html_article = client.text("Please format this article using HTML: #{raw_article}")

    # HTML
    puts 'HTML formatted Article Generated'

    write_to_file('html', topic, html_article)
    puts "HTML formatted Article Generated. Check the #{folder}/html folder for your article."

    html_article
  end

  def write_to_file(subfolder, topic, contents)
    extension = subfolder == 'html' ? 'html' : 'txt'
    File.open("#{folder}/#{subfolder}/#{topic}.#{extension}", 'w') { |file| file.write(contents) }
  end
end

ArticleGenerator.run
