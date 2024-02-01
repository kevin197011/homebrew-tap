class Fanyiweb < Formula
  desc "shell-helper command tool"
  homepage "https://github.com/kevin197011"
  version "latest"
  url "https://github.com/kevin197011/ktools/raw/main/shell-helper_#{version}.tar.gz"
  # sha256 "daa89355769ba2b0611faf9fb2d33656e7d91d3c2f55298ae5e999cfe6c4c0fd"
  license "MIT"

  def install
    bin.install "shell-helper"
  end

  test do
    system "false"
  end
end
