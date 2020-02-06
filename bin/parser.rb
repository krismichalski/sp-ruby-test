#!/usr/bin/env ruby

# frozen_string_literal: true

def fetch_visits
  visits = Hash.new { [] }

  File.foreach(ARGV[0]) do |line|
    path, ip = line.split(" ")
    visits[path] <<= ip
  end

  visits
end

def count(unique: false)
  fetch_visits.each_with_object({}) do |(path, ips_array), views|
    if unique
      views[path] = ips_array.uniq.size
    else
      views[path] = ips_array.size
    end
  end
end

def sort(unique: false)
  count(unique: unique).sort_by { |_path, view_count| -view_count }
end

p "================ SORTED =================="
sort.each do |path, view_count|
  p "#{path} #{view_count} visits"
end

p "================ UNIQUE =================="

sort(unique: true).each do |path, view_count|
  p "#{path} #{view_count} unique visits"
end
