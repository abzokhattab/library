# require 'rails/generators/resource_helpers'

class AcceptanceTestGenerator < Rails::Generators::NamedBase
  # include ::Rails::Generators::ResourceHelpers
  source_root File.expand_path('templates', __dir__)

  def create_helper_file
    # puts "here #{singular_table_name}, #{class_name}"
    template "acceptance_test.rb", File.join("spec/acceptance", "#{file_name.pluralize}_spec.rb")
  end
end
