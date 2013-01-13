require "mdpreview/version"
require 'mdpreview/translator' 
require 'pathname'
require 'FileUtils'

module Mdpreview
  # Your code goes here...
  def self.hi(a)  
    # p a+'--'
    #  translator = Translator.new(a)  
    #  translator.hi  
    # 
    a=File.expand_path('../../', a)
    p a + '======'
    file_path = a
    

    #获得当前执行文件的完整路径
    # puts Pathname.new(__FILE__).realpath
    #获得当前执行文件的目录完整路径
    
    ed_path =  Pathname.new(File.expand_path('../../vendor/ed', __FILE__)).realpath
    f=File.new(File.join(ed_path,"meta.js"), "w+")
    f.puts("#{file_path}")
    # f.save
    # TODO file copy to cur_file in ../../vendor/ed/
    
    FileUtils.cp file_path, '#{ed_path}/cur.file'

    ed_path =  Pathname.new(File.expand_path('../../vendor/ed/mdp.html', __FILE__)).realpath

    `open #{ed_path}`
  end
  
  
end
