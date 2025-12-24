cask "vagrant-manager" do
  version :latest
  sha256 :no_check

  url do
    require "open-uri"
    require "json"
    
    api_url = "https://api.github.com/repos/kevin197011/vagrant-manager/releases/latest"
    
    begin
      content = OpenURI.open_uri(api_url, "Accept" => "application/vnd.github.v3+json", "User-Agent" => "Homebrew").read
      release_data = JSON.parse(content)
      
      dmg_asset = release_data["assets"]&.find { |asset| asset["name"]&.include?("arm64.dmg") }
      
      if dmg_asset && dmg_asset["browser_download_url"]
        dmg_asset["browser_download_url"]
      else
        raise "ARM64 DMG asset not found in latest release"
      end
    rescue => e
      raise "Failed to fetch release information: #{e.message}"
    end
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

