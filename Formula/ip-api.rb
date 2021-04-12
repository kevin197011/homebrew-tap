class IpApi < Formula
  desc "ip-api command tool"
  homepage "https://github.com/kevin197011"
  version "v20210412"
  url "https://github.com/kevin197011/utils/raw/main/ip-api_#{version}.tar.gz"
  sha256 "53ad6db38cb596436b45829877fef488c813fb0b09e22adfd8c52c8cd1af07b8"
  license "MIT"

  def install
    bin.install "ip-api"
  end

  test do
    system "false"
  end
end
