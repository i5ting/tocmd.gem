require "mdpreview/version"
require 'mdpreview/translator' 
require 'pathname'

module Mdpreview
  # Your code goes here...
  def self.hi(a)  
    translator = Translator.new(a)  
    translator.hi  
    
    a=File.expand_path('../../', __FILE__)
    p a
    #获得当前执行文件的完整路径
    # puts Pathname.new(__FILE__).realpath
    #获得当前执行文件的目录完整路径
    path =  Pathname.new(File.expand_path('../../vendor/ed/mdp.html', __FILE__)).realpath
    `open #{path}`
  end
end
