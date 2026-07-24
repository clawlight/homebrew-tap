class Clawlight < Formula
  desc "TUI dashboard and macOS menu bar indicator for Claude Code sessions"
  homepage "https://github.com/clawlight/clawlight-cli"
  version "0.13.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.13.0/clawlight-v0.13.0-aarch64-apple-darwin.tar.gz"
    sha256 "bfc80f91af8cfa66c90880413e8cf0dafd9d87606b965d983c50d7c1f455e274"
  else
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.13.0/clawlight-v0.13.0-x86_64-apple-darwin.tar.gz"
    sha256 "41fcf19ceb087a5e1a571236b900266832ad341e81398f4d8e0b04fdb092541d"
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
