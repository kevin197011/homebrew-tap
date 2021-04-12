require "erb"
require "json"
require "net/http"
require "standard/rake"
require_relative "utils"

# Setting update app name
@app_name = "fanyiweb"
app_uri = "https://raw.githubusercontent.com/kevin197011/utils/main/#{@app_name}.json"

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
  uri = URI(app_uri)
  context = JSON.parse(Net::HTTP.get(uri))
  @app_version = context["version"]
  @app_sha256 = context["sha256"]
  render = ERB.new(File.read("app.rb.erb"))
  File.open("Formula/#{@app_name}.rb", "w") { |file| file.write(render.result(binding)) }
  # puts render.result(binding)
end

task :go do
  Rake::Task["update"].invoke
end
