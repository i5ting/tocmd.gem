require "mdpreview/version"
require 'mdpreview/translator' 
require 'pathname'

module Mdpreview
  # Your code goes here...
  def self.hi(language = :english)  
    translator = Translator.new(language)  
    translator.hi  
    
    #获得当前执行文件的完整路径
    puts Pathname.new(__FILE__).realpath
    #获得当前执行文件的目录完整路径
    puts Pathname.new(File.dirname(__FILE__)).realpath
  end
end
