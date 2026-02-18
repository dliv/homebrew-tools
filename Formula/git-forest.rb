class GitForest < Formula
  desc "Multi-repo worktree orchestrator for parallel development"
  homepage "https://github.com/dliv/workforest"
  version "0.2.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dliv/workforest/releases/download/v#{version}/git-forest-aarch64-apple-darwin.tar.gz"
      sha256 "ac25b371326d81dfa8ff4d5a17358a24ea11bfee7331b9243ee57c33c24e46b6"
    elsif Hardware::CPU.intel?
      url "https://github.com/dliv/workforest/releases/download/v#{version}/git-forest-x86_64-apple-darwin.tar.gz"
      sha256 "f290790f441a501d331cc3b3e6c6ba23f57300c23d77b53466a3e174c4cea185"
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
