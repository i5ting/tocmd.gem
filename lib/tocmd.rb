require "tocmd/version"
require "tocmd/translator"
require "tocmd/translator_local"
require "tocmd/translator_conf"

module Tocmd
  @no_browser = false

  def self.set_no_browser(flag)
    @no_browser = flag
  end

  # ---------------- tocmd command -----------------
  def self.hi(a)  
    translator = Translator.new(a)  
    translator.hi(@no_browser)  
    # puts version info
    p VERSION
  end
	
  def self.hi_dir(a)  
    translator = Translator.new(a)  
    translator.hi_dir(@no_browser) 
    # puts version info
    p VERSION
  end
  
  # ---------------- tocmd_local command -----------------
  def self.hi_local(a)  
    translator = TranslatorLocal.new(a)  
    translator.hi(@no_browser)  
    # puts version info
    p VERSION
  end
	
  def self.hi_dir_local(a)  
    translator = TranslatorLocal.new(a)  
    translator.hi_dir(@no_browser) 
    # puts version info
    p VERSION
  end
  
  # ---------------- tocmd_conf command -----------------
  def self.hi_conf(a)  
    translator = TranslatorConf.new(a)  
    translator.hi(@no_browser)
    # puts version info
    p VERSION
  end
	
  def self.hi_dir_conf(a)  
    translator = TranslatorConf.new(a)  
    translator.hi_dir(@no_browser)
    # puts version info
    p VERSION
  end

end
