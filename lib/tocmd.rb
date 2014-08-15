require "tocmd/version"
require "tocmd/translator"
require "tocmd/translator_local"
require "tocmd/translator_conf"
require "tocmd/translator_trans"

module Tocmd
  # ---------------- tocmd command -----------------
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
  
  # ---------------- tocmd_local command -----------------
  def self.hi_local(a)  
    translator = TranslatorLocal.new(a)  
    translator.hi  
    # puts version info
    p VERSION
  end
	
  def self.hi_dir_local(a)  
    translator = TranslatorLocal.new(a)  
    translator.hi_dir 
    # puts version info
    p VERSION
  end
  
  # ---------------- tocmd_conf command -----------------
  def self.hi_local(a)  
    translator = TranslatorConf.new(a)  
    translator.hi  
    # puts version info
    p VERSION
  end
	
  def self.hi_dir_local(a)  
    translator = TranslatorConf.new(a)  
    translator.hi_dir 
    # puts version info
    p VERSION
  end
  
  # ---------------- tocmd_trans command -----------------
  def self.hi_trans_local(a)  
    translator = TranslatorTrans.new(a)  
    translator.hi  
    # puts version info
    p VERSION
  end
	
  def self.hi_trans_dir_local(a)  
    translator = TranslatorTrans.new(a)  
    translator.hi_dir 
    # puts version info
    p VERSION
  end

end
