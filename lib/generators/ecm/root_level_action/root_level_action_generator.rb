require 'rails/generators/migration'

module Ecm
  module Generators
    class RootLevelActionGenerator < Rails::Generators::Base
      desc "Generates a controller action with view and routes it to the action name"
      
      argument :controller_name, :type => :string
      argument :action_name,     :type => :string
      
      def controller_filename
        "#{controller_name.underscore}_controller.rb"
      end
      
      def view_filename
        "app/views/#{controller_name.underscore}/#{action_name}.html.erb"
      end
           
      source_root File.expand_path('../templates', __FILE__)
      
      def generate_controller_action
          if (begin "#{controller_name}Controller".constantize rescue nil end.class == Class)
            inject_into_class "app/controllers/#{controller_filename}", "#{controller_name}Controller".constantize do
              "\n  def #{action_name}\n  end\n"
            end
          end  
      end      
      
      def generate_route
        route "  get '#{action_name}', :to => '#{controller_name.underscore}##{action_name}'"
      end      
      
      def generate_view
        template "view.html.erb", view_filename
      end
    end
  end
end        
