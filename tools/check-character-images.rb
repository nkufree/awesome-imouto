#!/usr/bin/env ruby
# Every published character must have a local illustration and a source credit.
require 'yaml'
require 'date'
require 'uri'
require 'json'

root = File.expand_path('..', __dir__)
records = JSON.parse(File.read(File.join(root, 'docs/character-images.json')))
seen = []
errors = []

Dir.glob(File.join(root, '_posts/*')).each do |post|
  front = File.read(post).match(/\A---\s*\n(.*?)\n---/m)
  next unless front

  data = YAML.safe_load(front[1], permitted_classes: [Date, Time])
  next unless data['character']

  title = data['title']
  seen << title
  image = data['image'] || {}
  %w[path thumbnail].each do |key|
    path = image[key].to_s
    if !path.start_with?('/assets/images/') || path.split('/').include?('..')
      errors << "#{title}: invalid image #{key}"
      next
    end

    file = File.join(root, path.delete_prefix('/'))
    if !File.file?(file) || File.size(file).zero?
      errors << "#{title}: missing image #{key}: #{path}"
    else
      header = File.binread(file, 12)
      unless header.start_with?('RIFF') && header[8, 4] == 'WEBP'
        errors << "#{title}: expected a WebP image: #{path}"
      end
    end
  end

  %w[alt source_name].each do |key|
    errors << "#{title}: missing image #{key}" if image[key].to_s.strip.empty?
  end
  %w[source original].each do |key|
    begin
      url = URI.parse(image[key].to_s)
      errors << "#{title}: invalid image #{key} URL" unless url.is_a?(URI::HTTPS) && url.host
    rescue URI::InvalidURIError
      errors << "#{title}: invalid image #{key} URL"
    end
  end

  record = records.find { |item| item['character'] == title }
  if !record || record['asset'] != image['path'] || record['source_page'] != image['source'] || record['original_image'] != image['original'] || record['thumbnail'] != image['thumbnail']
    errors << "#{title}: image provenance record is missing or inconsistent"
  end
end

errors << 'Image provenance contains duplicate or unmatched characters' unless records.map { |item| item['character'] }.sort == seen.sort
abort errors.join("\n") unless errors.empty?
puts "Verified local images, thumbnails and source credits for #{seen.size} characters."
