class Rate < Formula
  desc "rate command tool"
  homepage "https://github.com/kevin197011"
  version "v20210413"
  url "https://github.com/kevin197011/utils/raw/main/rate_#{version}.tar.gz"
  sha256 "85c936be48f45a478c960e6e8d23b8571b154c985108bcdf1620c42ad9c985db"
  license "MIT"

  def install
    bin.install "rate"
  end

  test do
    system "false"
  end
end
