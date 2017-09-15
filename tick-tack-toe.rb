Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }
require 'pry'

def run!
  play =  Play.new
  play.start
end


run! if __FILE__==$0
