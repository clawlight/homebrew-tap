class Clawlight < Formula
  desc "TUI dashboard and macOS menu bar indicator for Claude Code sessions"
  homepage "https://github.com/clawlight/clawlight-cli"
  version "0.10.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.10.2/clawlight-v0.10.2-aarch64-apple-darwin.tar.gz"
    sha256 "2a7f369b163a12b5d21ae6bc63de20310514f3e2fa3e603a4ae0c5626e4dd9b1"
  else
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.10.2/clawlight-v0.10.2-x86_64-apple-darwin.tar.gz"
    sha256 "c02007f0bc1749524ba966063722b8544e6903a433a46d03beef575c6aee9dfb"
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
