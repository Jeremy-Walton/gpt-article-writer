# Chat GPT Article Writer

Inspired by:
[ArticleWriter Python](https://github.com/frankcjones/articlewriter)

A ruby script that will write an article using ChatGPT

This project demonstrates how to use the OpenAI GPT-3.5 Turbo model, also known as ChatGPT, to automatically generate articles based on user-defined topics or keywords. With this implementation, you can quickly create draft articles, including section titles, related keywords, and HTML formatting, all with the assistance of ChatGPT

## Prerequisites

* **OpenAI API Key:** You'll need an OpenAI API key to authenticate and interact with the ChatGPT model. You can obtain one from the OpenAI website.
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

3. Install dependencies
```
bundle install
```

4. Create a `.env_overrides.rb` file in the project directory and add your OpenAI API key
```
ENV['OPENAI_ACCESS_TOKEN'] = 'YOUR_API_KEY'
```

## Usage

To use this project to generate articles, follow these steps:

Run `ruby main.rb`

Follow the prompt to provide a topic or keyword, and the article draft will be displayed.

It will generate a raw text version as well as an HTML version of the article draft in the articles folder.
