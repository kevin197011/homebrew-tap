# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class IpApi < Formula
  desc "check ip info command tool"
  homepage "https://github.com/kevin197011"
  url "https://github.com/kevin197011/utils/raw/main/ip-api.tar.gz"
  version "0.0.1"
  sha256 "bb9a473abdd843a2abf51aae65395fd5fa3fd69127f636bfca5b7f94a10b769c"
  license "MIT"


  def install
    bin.install "ip-api"
  end

  test do
    system "false"
  end
end

