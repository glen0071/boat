# frozen_string_literal: true

require 'json'
require 'fileutils'

class DataTransferJsonService
  def self.export
    filepath = File.join(Rails.root, 'data',
                         DateTime.now.strftime('%v_%H_%M_%S') + '.json')

    export_data = []
    Author.all.each do |author|
      author_hash = {}
      Author.column_names.reject { |column| column == 'id' }.each do |attr|
        author_hash[attr.to_sym] = author.send(attr)
      end
      author_hash[:quotes] = []
      author.quotes.each do |quote|
        quote_hash = {}
        Quote.column_names.reject { |column| column.include?('id') }.each do |attr|
          quote_hash[attr.to_sym] = quote.send(attr)
        end
        quote_hash[:topics] = []
        quote.topics.each do |topic|
          topic_hash = {}
          Topic.column_names.reject { |column| column == 'id' }.each do |attr|
            topic_hash[attr.to_sym] = topic.send(attr)
          end
          quote_hash[:topics] << topic_hash
        end
        author_hash[:quotes] << quote_hash
      end
      export_data << author_hash
    end

    File.open(filepath, 'w') do |f|
      f.write(JSON.pretty_generate(export_data))
    end
  end

  def self.import(file)
    file = File.open File.join(Rails.root, 'data', file)
    data = JSON.load file
    data.each do |author_hash|
      author_hash.deep_symbolize_keys!
      author = Author.find_or_create_by(name: author_hash[:name])
      quotes = author_hash.delete(:quotes)
      author.update_attributes(author_hash)
      quotes.each do |quote_hash|
        topics = quote_hash.delete(:topics)
        quote = Quote.find_or_create_by(text: quote_hash[:text])
        quote.update_attributes(quote_hash)
        author.quotes << quote
        topics.each do |topic_hash|
          topic = Topic.find_or_create_by(name: topic_hash[:name])
          topic.update_attributes(topic_hash)
          quote.topics << topic
        end
      end
    end
  end
end
