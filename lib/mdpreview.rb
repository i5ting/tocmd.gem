require "mdpreview/version"
require 'mdpreview/translator' 

module Mdpreview
  # Your code goes here...
  def self.hi(a)  
    translator = Translator.new(a)  
    translator.hi  
    # puts version info
    p VERSION
  end
	
  def self.hi_dir(a)  
    translator = Translator.new(a)  
    translator.hi_dir 
    # puts version info
    p VERSION
  end
end
