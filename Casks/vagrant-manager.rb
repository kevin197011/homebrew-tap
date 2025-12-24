cask "vagrant-manager" do
  version "2.8.6"
  sha256 "d7990dc1f94d36f3ae9fb6c5e6a5a59ace41e34f44e7438a0872c5b401775c29"

  url "https://github.com/kevin197011/vagrant-manager/releases/download/v#{version}/vagrant-manager-#{version}-arm64.dmg",
      verified: "github.com/kevin197011/vagrant-manager/"
  name "Vagrant Manager"
  desc "Manage your vagrant machines in one place with Vagrant Manager for macOS"
  homepage "https://github.com/kevin197011/vagrant-manager"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Vagrant Manager.app"

  uninstall quit: "lanayo.Vagrant-Manager",
            delete: [
              "#{appdir}/Vagrant Manager.app",
            ]

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

