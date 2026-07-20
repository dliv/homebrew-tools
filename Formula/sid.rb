class Sid < Formula
  desc "Deterministic local task memory for humans and agents"
  homepage "https://github.com/dliv/slopid"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dliv/slopid/releases/download/v#{version}/sid-aarch64-apple-darwin.tar.gz"
      sha256 "30c5503f633d52143a1bb4d4a4554f191b501387b78e1e8dcc6adaa379c22cc4"
    elsif Hardware::CPU.intel?
      url "https://github.com/dliv/slopid/releases/download/v#{version}/sid-x86_64-apple-darwin.tar.gz"
      sha256 "9579eba5fe05323da4377ed1d1efa8d3e6c16464a59651754916f18762d061ca"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "sid-aarch64-apple-darwin" => "sid"
    elsif Hardware::CPU.intel?
      bin.install "sid-x86_64-apple-darwin" => "sid"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sid --version")
  end
end
