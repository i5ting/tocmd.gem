class Mdpreview::Translator  
  def initialize(language)  
    @language = language  
  end  
  
  def hi
      p "hello world #{@language}"  
  end  
end  
