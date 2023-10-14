# Chat GPT Article Writer

Inspired by:
[ArticleWriter Python](https://github.com/frankcjones/articlewriter)

A ruby script that will write an article using ChatGPT

This project demonstrates how to use the OpenAI GPT-3.5 Turbo model, also known as ChatGPT, to automatically generate articles based on user-defined topics or keywords. With this implementation, you can quickly create draft articles, including section titles, related keywords, and HTML formatting, all with the assistance of ChatGPT

## Prerequisites

* **OpenAI API Key:** You'll need an OpenAI API key to authenticate and interact with the ChatGPT model. You can obtain one from the OpenAI website.
* **OpenAI Organization Key:** You'll need an OpenAI Organization key to authenticate and interact with the ChatGPT model. You can obtain one from the OpenAI website.
* **Ruby:** Ruby 3.1.1 needs to be installed.



## Getting Started

1. Clone this repository
```
git clone https://github.com/Jeremy-Walton/gpt-article-writer/
```

2. Navigate to the project directory
```
cd gpt-article-writer
```

3. Install Bundler
```
sudo gem install bundler
```

4. Install dependencies
```
sudo bundle install
```

5. Create a `.env_overrides.rb` file in the project directory and add your OpenAI API key
```
ENV['OPENAI_ACCESS_TOKEN'] = 'YOUR_API_KEY'
ENV['OPENAI_ORGANIZATION_ID'] = 'YOUR_ORGANIZATION_KEY'
```

## Usage

### Article

To use this project to generate articles, follow these steps:

Run `ruby article_generator.rb`

Follow the prompt to provide a topic or keyword, and the article draft will be displayed.

It will generate a raw text version as well as an HTML version of the article draft in the articles folder.

### Image

To use this project to generate images, follow these steps:

Run `ruby image_generator.rb`

Follow the prompt to provide a text prompt.

It will generate a url with the generated image.
