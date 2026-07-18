class Clawlight < Formula
  desc "TUI dashboard and macOS menu bar indicator for Claude Code sessions"
  homepage "https://github.com/clawlight/clawlight-cli"
  version "0.11.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.11.1/clawlight-v0.11.1-aarch64-apple-darwin.tar.gz"
    sha256 "50b65a5cdbec401909fcc95a38f3f203978090556a7b3f822a4b2ca2ba86f71d"
  else
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.11.1/clawlight-v0.11.1-x86_64-apple-darwin.tar.gz"
    sha256 "c2d25d64fe0ad83a1153102e52ccaecaf5de28b0dbfe71b135bed42235424efd"
  end

  def install
    bin.install "clawlight"
  end

  def caveats
    <<~EOS
      Just run:

        clawlight

      The first launch registers the Claude Code hooks and starts the
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
