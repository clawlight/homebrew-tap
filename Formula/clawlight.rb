class Clawlight < Formula
  desc "TUI dashboard and macOS menu bar indicator for Claude Code sessions"
  homepage "https://github.com/clawlight/clawlight-cli"
  version "0.12.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.12.0/clawlight-v0.12.0-aarch64-apple-darwin.tar.gz"
    sha256 "2ff325cda99e63e65d9854adc31ac9a90c769b0c2fffac73f6a87bd0b9b3cdb2"
  else
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.12.0/clawlight-v0.12.0-x86_64-apple-darwin.tar.gz"
    sha256 "63c4ee1549b70d410df6331d86629490af3c9a306ef3f24bb48b0b35f073f9e2"
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
