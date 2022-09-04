#https://github.com/rails/rails/blob/b9ca94caea2ca6a6cc09abaffaad67b447134079/railties/lib/rails/generators/rails/scaffold_controller/scaffold_controller_generator.rb

require "rails/generators/resource_helpers"

class Rails::ApiControllerGenerator < Rails::Generators::NamedBase
  # include ResourceHelpers

  #   def create_controller_file
  #     create_file "app/helpers/#{file_name}_helper.rb", <<-FILE
  # module #{class_name}Helper
  #   attr_reader :#{plural_name}, :#{plural_name.singularize}
  # end
  #     FILE
  #   end

  check_class_collision suffix: "Controller"

  class_option :helper, type: :boolean
  class_option :orm, banner: "NAME", type: :string, required: true,
               desc: "ORM to generate the controller for"
  class_option :api, type: :boolean,
               desc: "Generates API controller"

  argument :attributes, type: :array, default: [], banner: "field:type field:type"

  def create_controller_files
    template_file = options.api? ? "api_controller.rb" : "controller.rb"
    subfolder = options.api? ? "api/v1" : ""
    generate "policy", file_name
    generate "acceptance_test", file_name
    template template_file, File.join("app/controllers", subfolder, "#{file_name.pluralize}_controller.rb")
  end

  hook_for :template_engine, as: :scaffold do |template_engine|
    invoke template_engine #, File.join("app/views", "#{file_name.pluralize}_controller.rb")
  end

  hook_for :test_framework, as: :scaffold do |instance, controller|
    instance.invoke controller, [instance.name.pluralize]
  end

  # Invoke the helper using the controller name (pluralized)
  hook_for :helper, as: :scaffold do |invoked|
    invoke invoked, [file_name.pluralize]
  end
end