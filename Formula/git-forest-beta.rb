class GitForestBeta < Formula
  desc "Multi-repo worktree orchestrator for parallel development (beta)"
  homepage "https://github.com/dliv/workforest"
  version "0.2.18-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dliv/workforest/releases/download/v#{version}/git-forest-beta-aarch64-apple-darwin.tar.gz"
      sha256 "bffc0f955cfbe9231637b1096bd68e3949b016708be9b6fab36062f6ccc5553d"
    elsif Hardware::CPU.intel?
      url "https://github.com/dliv/workforest/releases/download/v#{version}/git-forest-beta-x86_64-apple-darwin.tar.gz"
      sha256 "c2191683487a4e74fa276f98e55cdd63fa6a6b4820c755d52eb8a9d222bec7c9"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "git-forest-beta-aarch64-apple-darwin" => "git-forest-beta"
    elsif Hardware::CPU.intel?
      bin.install "git-forest-beta-x86_64-apple-darwin" => "git-forest-beta"
    end
  end

  def caveats
    <<~EOS
      git-forest-beta is invoked as a git subcommand:
        git forest-beta init --help

      This is the beta channel — it can be installed alongside git-forest (stable).

      For agentic workflows, add this to your project's AGENTS.md or CLAUDE.md:

        ## git-forest-beta

        This project uses `git forest-beta` to manage multi-repo worktrees
        for feature development and PR review. When the user asks to create
        a forest, worktree environment, or review a PR across repos,
        run `git forest-beta agent-instructions` for full usage guidance.

      Version checking: git-forest-beta checks for updates daily
      (sends current version to forest.dliv.gg). Disable in config:
        Set version_check.enabled = false in ~/.config/git-forest-beta/config.toml
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-forest-beta --version")
  end
end
