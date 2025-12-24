cask "vagrant-manager" do
  version :latest
  sha256 :no_check

  url do
    require "net/http"
    require "json"
    
    uri = URI("https://api.github.com/repos/kevin197011/vagrant-manager/releases/latest")
    response = Net::HTTP.get_response(uri)
    release_data = JSON.parse(response.body)
    
    # Find the ARM64 DMG asset
    dmg_asset = release_data["assets"].find { |asset| asset["name"].include?("arm64.dmg") }
    dmg_asset["browser_download_url"]
  end

  name "Vagrant Manager"
  desc "Manage your vagrant machines in one place with Vagrant Manager for macOS"
  homepage "https://github.com/kevin197011/vagrant-manager"

  livecheck do
    url "https://github.com/kevin197011/vagrant-manager/releases/latest"
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Vagrant Manager.app"

  postflight do
    # Remove quarantine attributes to fix "damaged" error on macOS
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Vagrant Manager.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Vagrant Manager",
    "~/Library/Preferences/com.vagrantmanager.vagrantmanager.plist",
  ]
end

