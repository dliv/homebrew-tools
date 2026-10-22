class Sid < Formula
  desc "Deterministic local task memory for humans and agents"
  homepage "https://github.com/dliv/slopid"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dliv/slopid/releases/download/v#{version}/sid-aarch64-apple-darwin.tar.gz"
      sha256 "95a98a3156b5b41d35da671f3077339ab964374a3f1626ccef435da068a7d2b8"
    elsif Hardware::CPU.intel?
      url "https://github.com/dliv/slopid/releases/download/v#{version}/sid-x86_64-apple-darwin.tar.gz"
      sha256 "608761113b6830b848f2330138ec70383d80238e2ae287d5f3bb824fb87eb854"
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
