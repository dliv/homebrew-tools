class Sid < Formula
  desc "Deterministic local task memory for humans and agents"
  homepage "https://github.com/dliv/slopid"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dliv/slopid/releases/download/v#{version}/sid-aarch64-apple-darwin.tar.gz"
      sha256 "8658a5ddd669edc5fe2b48153d676267c209d792ab51e63ae7f367da5134ceb5"
    elsif Hardware::CPU.intel?
      url "https://github.com/dliv/slopid/releases/download/v#{version}/sid-x86_64-apple-darwin.tar.gz"
      sha256 "6fc5acc93464b44985a5e5c0c301ec9556781325719e20c2b92e62960f96b780"
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
