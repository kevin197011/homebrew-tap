class Rate < Formula
  desc "usd-rate command tool"
  homepage "https://github.com/kevin197011"
  version "latest"
  url "https://github.com/kevin197011/ktools/raw/main/usd-rate_#{version}.tar.gz"
  # sha256 "85c936be48f45a478c960e6e8d23b8571b154c985108bcdf1620c42ad9c985db"
  license "MIT"

  def install
    bin.install "usd-rate"
  end

  test do
    system "false"
  end
end
