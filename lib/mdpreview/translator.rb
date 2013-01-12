class Mdpreview::Translator  
  def initialize(language)  
    @language = language  
  end  
  
  def hi  
    case @language  
    when :spanish  
      "hola mundo"  
    else  
      "hello world"  
    end  
  end  
end  
