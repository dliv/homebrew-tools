class GitForest < Formula
  desc "Multi-repo worktree orchestrator for parallel development"
  homepage "https://github.com/dliv/workforest"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dliv/workforest/releases/download/v#{version}/git-forest-aarch64-apple-darwin.tar.gz"
      sha256 "67e30cce81a6e19eb694dd4b83dd4b2b835d0bb7914e7365038e790a7ba9abd9"
    elsif Hardware::CPU.intel?
      url "https://github.com/dliv/workforest/releases/download/v#{version}/git-forest-x86_64-apple-darwin.tar.gz"
      sha256 "9a9aedb155631814837aa157dc10cf423bd37d74dedecf2e6d4f2f621b0fb56a"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "git-forest-aarch64-apple-darwin" => "git-forest"
    elsif Hardware::CPU.intel?
      bin.install "git-forest-x86_64-apple-darwin" => "git-forest"
    end
  end

  def caveats
    <<~EOS
      git-forest is invoked as a git subcommand:
        git forest init --help

      For agentic workflows, add this to your project's AGENTS.md or CLAUDE.md:

        ## git-forest

        This project uses `git forest` to manage multi-repo worktrees for
        feature development and PR review. When the user asks to create a
        forest, worktree environment, or review a PR across repos,
        run `git forest agent-instructions` for full usage guidance.

      Version checking: git-forest checks for updates daily
      (sends current version to forest.dliv.gg). Disable in config:
        Set version_check.enabled = false in ~/.config/git-forest/config.toml
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-forest --version")
  end
end
