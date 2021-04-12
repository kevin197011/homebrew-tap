require "erb"
require "json"
require "net/http"
require "standard/rake"
require_relative "utils"

task :fmt do
  Rake::Task["standard:fix"].invoke
end

task push: :fmt do
  sh "git add ."
  sh "git commit -m 'Update.'"
  sh "git push origin main"
end

task :update do
  @app_class_name = class_s(@app_name)
  uri = URI(@app_uri)
  context = JSON.parse(Net::HTTP.get(uri))
  @app_version = context["version"]
  @app_sha256 = context["sha256"]
  render = ERB.new(File.read("app.rb.erb"))
  File.open("Formula/#{@app_name}.rb", "w") { |file| file.write(render.result(binding)) }
  puts "Updated app #{@app_name} succeed!"
end

task :go do
  Dir.glob("Formula/*.rb").each do |file|
    app_name = File.basename(file, ".rb")
    # Setting update app name
    @app_name = app_name
    @app_uri = "https://raw.githubusercontent.com/kevin197011/utils/main/#{@app_name}.json"
    Rake::Task["update"].execute
  end
end
