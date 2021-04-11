class IpApi < Formula
  desc "check ip info command tool"
  homepage "https://github.com/kevin197011"
  version "v20210412"
  url "https://github.com/kevin197011/utils/raw/main/ip-api_#{version}.tar.gz"
  sha256 "fb73079e0fcd20fd830b9b065eeaad09a2fd342ab077628ca859f363c7f938a9"
  license "MIT"


  def install
    bin.install "ip-api"
  end

  test do
    system "false"
  end
end

