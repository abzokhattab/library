class PolicyGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def create_helper_file
    folders = class_name.split(/v([0-9]::+)/i).last.split("::")[0..-1] #.map{|f| f.underscore}
    puts "creating policy in folders #{folders.map(&:downcase)}"
    template "policy.rb", File.join("app/policies", "#{file_name}_policy.rb")
    # template "policy.rb", File.join("app/policies", folders.map(&:downcase), "#{file_name}_policy.rb")
  end
end
