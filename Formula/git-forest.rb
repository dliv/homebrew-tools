class GitForest < Formula
  desc "Multi-repo worktree orchestrator for parallel development"
  homepage "https://github.com/dliv/workforest"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dliv/workforest/releases/download/v#{version}/git-forest-aarch64-apple-darwin.tar.gz"
      sha256 "98be650a82958b562b95973e7d888486044462058ea48990cc5bbc5376824350"
    elsif Hardware::CPU.intel?
      url "https://github.com/dliv/workforest/releases/download/v#{version}/git-forest-x86_64-apple-darwin.tar.gz"
      sha256 "676f27a958a19dbca779bcdcd47c921c4af85f45c3b9505f468aaf3499164ca5"
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
