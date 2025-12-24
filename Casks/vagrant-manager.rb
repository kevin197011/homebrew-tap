cask "vagrant-manager" do
  version "2.8.3"
  sha256 "58482cc66df1ada7d9b53d579cfd03dfd8cd9eb8dc3e00cddf4f018fb4000358"

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

  uninstall_preflight do
    # Quit the app before uninstall to avoid permission issues
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "Vagrant Manager" to quit'],
                   sudo: false,
                   must_succeed: false
    sleep 1
  end

  uninstall delete: [
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

