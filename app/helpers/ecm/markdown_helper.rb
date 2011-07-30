module Ecm
  module MarkdownHelper
    def m(text)
      begin
        raw RDiscount.new(text, :autolink).to_html
      rescue
        text
      end    
    end
  end  
end  
