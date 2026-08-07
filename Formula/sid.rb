class Sid < Formula
  desc "Deterministic local task memory for humans and agents"
  homepage "https://github.com/dliv/slopid"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dliv/slopid/releases/download/v#{version}/sid-aarch64-apple-darwin.tar.gz"
      sha256 "f01b72c05c0b8663bd08d4fa6a4abc18691d0bef8d6d183718fab90099acc009"
    elsif Hardware::CPU.intel?
      url "https://github.com/dliv/slopid/releases/download/v#{version}/sid-x86_64-apple-darwin.tar.gz"
      sha256 "75d4a7cad0f283b19ff554524e73c5e22a0a6416165cce4d3638e4e8ad7cc7a4"
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
