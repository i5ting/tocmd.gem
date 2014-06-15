require 'pathname' 
# require 'FileUtils'
require 'fileutils'

class Mdpreview::Translator  
  def initialize(source_file_path) 
    #源文件路径
    @source_file_path = source_file_path    
    #gem跟目录                          
    @gem_root_path = File.expand_path('../', @source_file_path)   
    #editor path
    @editor_path =  Pathname.new(File.expand_path('../../../vendor', __FILE__)).realpath.to_s  
    
    # p "@gem root_path:::"+@gem_root_path  
   #  p "@src file_path:::"+@source_file_path
   #  p "@editor  path :::"+@editor_path
     
  end  
  
  def hi
      generate_meta_js
      # cp_source_file_to_cur_file
      
			ar = @source_file_path.split('/')
			ar.pop()
			
			puts "src path = #{ar.join('/').to_s}"
			src_path = ar.join('/').to_s
			
			ar.push('preview');
			dest_dir = ar.join('/').to_s
			
			puts "desc path = #{ar.join('/').to_s}"
			
			build_with_dir(@source_file_path ,dest_dir)
			
			open_in_browser
  end
	
  def hi_dir
      generate_meta_js
      # cp_source_file_to_cur_file
      
			
			ar = @source_file_path.split('/')
			# ar.pop()
			
			puts "hi_dir src path = #{ar.join('/').to_s}"
			src_path = ar.join('/').to_s
			
			ar.push('preview');
			dest_dir = ar.join('/').to_s
			
			puts "hi_dir desc path = #{ar.join('/').to_s}"
			
			build_with_dir(src_path ,dest_dir)
			
			open_in_browser
  end
  
  def open_in_browser
		ar = @source_file_path.split('/')

		if File.directory?(@source_file_path) == false #普通文件
				file_name = ar.pop().split('.')[0]
				src_path = ar.join('/').to_s

				ar.push('preview');
				dest_dir = ar.join('/').to_s		
				
				`open #{ar.join('/').to_s}/#{file_name}.html`		
		
		else  
			# 目录
			src_path = ar.join('/').to_s

			Dir.foreach(src_path) do |ff| 
				file_name = ff.split('.')[0]
			end
		
			ar.push('preview');
			dest_dir = ar.join('/').to_s		
			`open #{ar.join('/').to_s}/#{file_name}.html`		
		end
  end
  
  def generate_meta_js
    f = File.new(File.join(@editor_path,"meta.js"), "w+")
    f.puts("#{@source_file_path}")
  end
  
  def cp_source_file_to_cur_file
		# cp param must be string
    f = File.new(File.join(@editor_path,"cur.file"), "w+").path
    FileUtils.cp(@source_file_path,f)
  end
	
	def build_with_dir(destiny_dir,dest_dir)
		p "start building......"
		
		if File.directory?(destiny_dir) == false
			p 'process_with_one'
			ar = @source_file_path.split('/')
			file_name = ar.pop().split('.')[0]
		
			src_path = ar.join('/').to_s

			ar.push('preview');
			dest_dir = ar.join('/').to_s		
			
			# return;
			process_with_one(src_path,dest_dir,destiny_dir.split('/').pop().to_s)
			
			return;
		end
		
		p "src_dir = #{destiny_dir}"
		p "dest_dir = #{dest_dir}"
		Dir.foreach(destiny_dir) do |ff| 
		  # puts ff
			unless /^\./ =~ ff ||/^images/ =~ ff ||/^css/ =~ ff || File.directory?(ff) || File.extname(ff) != '.md'
				
				process_with_one(destiny_dir,dest_dir,ff)
			
			end
		end 
	end 
 
  def process_with_one(destiny_dir ,dest_dir ,ff)
		# get markdown text
		text = IO.read(destiny_dir + '/' + ff)

		# options = [:fenced_code,:generate_toc,:hard_wrap,:no_intraemphasis,:strikethrough,:gh_blockcode,:autolink,:xhtml,:tables]

		# convert to html
		markdown = Redcarpet::Markdown.new(HTMLwithPygments,:gh_blockcode=>true,:no_intra_emphasis=>true,:filter_html => true,:hard_wrap => true,:autolink => true, :space_after_headers => true,:fenced_code_blocks => true)
		parse_markdown = markdown.render(text)
		# parse_markdown = syntax_highlighter(parse_markdown)
	
		css_link = ''
		if destiny_dir.to_s.index('/') 
			css_link =  %Q{
					<link href="#{@editor_path}/toc/style/github-bf51422f4bb36427d391e4b75a1daa083c2d840e.css" media="all" rel="stylesheet" type="text/css"/>
					<link href="#{@editor_path}/toc//style/github2-d731afd4f624c99a4b19ad69f3083cd6d02b81d5.css" media="all" rel="stylesheet" type="text/css"/>
					<link href="#{@editor_path}/toc/css/zTreeStyle/zTreeStyle.css" media="all" rel="stylesheet" type="text/css"/>
			}
		else
			css_link =  %Q{
					<link href="#{@editor_path}/toc/style/github-bf51422f4bb36427d391e4b75a1daa083c2d840e.css" media="all" rel="stylesheet" type="text/css"/>
					<link href="#{@editor_path}/toc/style/github2-d731afd4f624c99a4b19ad69f3083cd6d02b81d5.css" media="all" rel="stylesheet" type="text/css"/>
					<link href="#{@editor_path}/toc/css/zTreeStyle/zTreeStyle.css" media="all" rel="stylesheet" type="text/css"/>
			}
		end
	
	  t = %Q{
	    <html>
	      <head>
				  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	        <title>#{ff.gsub('.md','')}</title>
					#{css_link}
				  <style>
					pre {
					    counter-reset: line-numbering;
					    border: solid 1px #d9d9d9;
					    border-radius: 0;
					    background: #fff;
					    padding: 0;
					    line-height: 23px;
					    margin-bottom: 30px;
					    white-space: pre;
					    overflow-x: auto;
					    word-break: inherit;
					    word-wrap: inherit;
					}

					pre a::before {
					  content: counter(line-numbering);
					  counter-increment: line-numbering;
					  padding-right: 1em; /* space after numbers */
					  width: 25px;
					  text-align: right;
					  opacity: 0.7;
					  display: inline-block;
					  color: #aaa;
					  background: #eee;
					  margin-right: 16px;
					  padding: 2px 10px;
					  font-size: 13px;
					  -webkit-touch-callout: none;
					  -webkit-user-select: none;
					  -khtml-user-select: none;
					  -moz-user-select: none;
					  -ms-user-select: none;
					  user-select: none;
					}

					pre a:first-of-type::before {
					  padding-top: 10px;
					}

					pre a:last-of-type::before {
					  padding-bottom: 10px;
					}

					pre a:only-of-type::before {
					  padding: 10px;
					}
			
					.highlight { background-color: #ffffcc } /* RIGHT */
					</style>
	      </head>
	      <body>
				  <div>
							<div style='width:25%;'>
									<ul id="tree" class="ztree" style='width:100%'>
		
									</ul>
							</div>
			        <div id='readme' style='width:70%;margin-left:20%;'>
			          	<article class='markdown-body'>
			            	#{parse_markdown}
			          	</article>
			        </div>
					</div>
	      </body>
	    </html>
			<script type="text/javascript" src="#{@editor_path}/toc/js/jquery-1.4.4.min.js"></script>
			<script type="text/javascript" src="#{@editor_path}/toc/js/jquery.ztree.all-3.5.min.js"></script>
			<script type="text/javascript" src="#{@editor_path}/toc/js/ztree_toc.js"></script>
			<SCRIPT type="text/javascript" >
			<!--
			$(document).ready(function(){
				$('#tree').ztree_toc({
					is_auto_number:true,
					documment_selector:'.markdown-body'
				});
			});
			//-->
			</SCRIPT>
	  }
	
		if destiny_dir.to_s.index('/') 
			# p '1build src/' + destiny_dir.to_s.split('/')[1] + '/' + ff.gsub('.md','') + '.html'
			build_dir = 'preview/'
			
			p 'build = ' + dest_dir + '/' + ff.gsub('.md','') + '.html'
			IO.write(dest_dir +  '/'  + ff.gsub('.md','') + '.html',t) # => 10
		else
			# p '2build src/' + ff.gsub('.md','') + '.html'
			build_dir = 'preview/'  
			# write to html file
			IO.write(build_dir + '/' + ff.gsub('.md','') + '.html',t) # => 10
		end
	end
  
end  


require 'redcarpet'
require 'pygments'

require 'redcarpet'
require 'rexml/document'
module Redcarpet::Render
  class Custom < Base
    def header(title, level)
      @headers ||= []
 
      title_elements = REXML::Document.new(title)
      flattened_title = title_elements.inject('') do |flattened, element|
        flattened +=  if element.respond_to?(:text)
                        element.text
                      else
                        element.to_s
                      end
      end
      permalink = flattened_title.downcase.gsub(/[^a-z\s]/, '').gsub(/\W+/, "-")
      
      # for extra credit: implement this as its own method
      if @headers.include?(permalink)
        permalink += "_1"
         # my brain hurts
        loop do
          break if !@headers.include?(permalink)
          # generate titles like foo-bar_1, foo-bar_2
          permalink.gsub!(/\_(\d+)$/, "_#{$1.to_i + 1}")
        end
      end
      @headers << permalink
      %(\n<h#{level}><a name="#{permalink}" class="anchor" href="##{permalink}"><span class="anchor-icon"></span></a>#{title}</h#{level}>\n)
    end
  end
end

class HTMLwithPygments < Redcarpet::Render::HTML
	def doc_header()
    '<style>' + Pygments.css('.highlight',:style => 'friendly') + '</style>'
  end
	
  def block_code(code, language)
    Pygments.highlight(code, :lexer => language, :options => {:encoding => 'utf-8'})
  end
end
