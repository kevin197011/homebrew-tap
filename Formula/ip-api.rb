class IpApi < Formula
  desc "ip-api command tool"
  homepage "https://github.com/kevin197011"
  version "latest"
  url "https://github.com/kevin197011/ktools/raw/main/ip-api_#{version}.tar.gz"
  # sha256 "ebd78b1c5006b613553bad6b9bb4ffc508d1973d263f288567dd163ebc679428"
  license "MIT"

  def install
    bin.install "ip-api"
  end

  test do
    system "false"
  end
end
