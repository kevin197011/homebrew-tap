cask "vagrant-manager" do
  version "2.8.1"
  sha256 "331c619a34f23d586c3ffad7bc45ddeeee9f8d8ecf912bfb524da69978b194e4"

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

  preflight do
    # Remove existing app if it exists to avoid conflicts
    if File.exist?("#{appdir}/Vagrant Manager.app")
      system_command "/bin/rm",
                     args: ["-rf", "#{appdir}/Vagrant Manager.app"],
                     sudo: false
    end
  end

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

