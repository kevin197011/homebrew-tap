class IpApi < Formula
  desc "check ip info command tool"
  homepage "https://github.com/kevin197011"
  version "v20210412"
  url "https://github.com/kevin197011/utils/raw/main/ip-api_#{version}.tar.gz"
  sha256 "9ddb17b08515a689842fd553b944024e95a7f5f2dfd5f4ad5cfd11c1c57c9832"
  license "MIT"


  def install
    bin.install "ip-api"
  end

  test do
    system "false"
  end
end

