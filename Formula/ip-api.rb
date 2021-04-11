# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class IpApi < Formula
  desc "check ip info command tool"
  homepage "https://github.com/kevin197011"
  url "https://github.com/kevin197011/utils/raw/main/ip-api.tar.gz"
  version "0.0.1"
  sha256 "b3080f284d82254135e173da51e38181c220179da3240160797a1fe366767da5"
  license "MIT"


  def install
    bin.install "ip-api"
  end

  test do
    system "false"
  end
end

