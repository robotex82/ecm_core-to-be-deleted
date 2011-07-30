module Ecm
  module Core
    class Engine < Rails::Engine
      config.to_prepare do
        ApplicationController.helper(Ecm::MarkdownHelper)
      end    
    end  
  end
end
