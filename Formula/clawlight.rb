class Clawlight < Formula
  desc "TUI dashboard and macOS menu bar indicator for Claude Code, opencode, Codex, and Copilot sessions"
  homepage "https://github.com/clawlight/clawlight-cli"
  version "0.13.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.13.1/clawlight-v0.13.1-aarch64-apple-darwin.tar.gz"
    sha256 "07fe3a6a87590a1a8f0d5ecc4251f435eb490c8ce5730f897d2b2c8919452b5f"
  else
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.13.1/clawlight-v0.13.1-x86_64-apple-darwin.tar.gz"
    sha256 "df3bf6aaab0eeb36b6c401c61109f591224cb15101d2c32fdde43e9c22aeef00"
  end

  def install
    bin.install "clawlight"
  end

  def caveats
    <<~EOS
      Just run:

        clawlight

      The first launch registers hooks for Claude Code and every detected
      coding agent (opencode, Codex CLI, GitHub Copilot CLI) and starts the
      menu bar daemon (a LaunchAgent that runs at login) automatically.
      Prefer to set it up without opening the dashboard? Run:

        clawlight install

      Either way the menu bar icon appears immediately and auto-starts
      on subsequent logins.

      To remove everything:

        clawlight uninstall
    EOS
  end

  test do
    assert_match "clawlight",
      shell_output("#{bin}/clawlight --help")
  end
end
