cask "vagrant-manager" do
  version "2.8.8"
  sha256 "ab26d60dce5e92d0004627646d477345aa12888925de1a79d2255473434035ee"

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
    # Force quit the app before uninstall to avoid permission issues
    # This ensures the app is closed even if uninstall quit: doesn't work
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "Vagrant Manager" to quit'],
                   sudo: false,
                   must_succeed: false
    
    # Wait for graceful quit (up to 5 seconds)
    sleep 5
    
    # Force kill any remaining processes (safe to run even if app already quit)
    system_command "/usr/bin/killall",
                   args: ["-9", "Vagrant Manager"],
                   sudo: false,
                   must_succeed: false
    
    # Wait for processes to fully terminate and file locks to be released
    sleep 2
  end

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

