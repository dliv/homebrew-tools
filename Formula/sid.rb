class Sid < Formula
  desc "Deterministic local task memory for humans and agents"
  homepage "https://github.com/dliv/slopid"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dliv/slopid/releases/download/v#{version}/sid-aarch64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    elsif Hardware::CPU.intel?
      url "https://github.com/dliv/slopid/releases/download/v#{version}/sid-x86_64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
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
