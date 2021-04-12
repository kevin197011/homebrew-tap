class Fanyiweb < Formula
  desc "fanyiweb command tool"
  homepage "https://github.com/kevin197011"
  version "v20210412"
  url "https://github.com/kevin197011/utils/raw/main/fanyiweb_#{version}.tar.gz"
  sha256 "daa89355769ba2b0611faf9fb2d33656e7d91d3c2f55298ae5e999cfe6c4c0fd"
  license "MIT"

  def install
    bin.install "fanyiweb"
  end

  test do
    system "false"
  end
end
