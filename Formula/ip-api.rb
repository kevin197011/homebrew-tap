class IpApi < Formula
  desc "ip-api command tool"
  homepage "https://github.com/kevin197011"
  version "v20210412"
  url "https://github.com/kevin197011/utils/raw/main/ip-api_#{version}.tar.gz"
  sha256 "4185e2e88ad187c403d0a6bc1574aa22af3bbefea8db969df523f544e3f45186"
  license "MIT"

  def install
    bin.install "ip-api"
  end

  test do
    system "false"
  end
end
