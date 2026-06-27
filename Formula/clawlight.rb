class Clawlight < Formula
  desc "TUI dashboard and macOS menu bar indicator for Claude Code sessions"
  homepage "https://github.com/clawlight/clawlight-cli"
  version "0.7.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.7.0/clawlight-v0.7.0-aarch64-apple-darwin.tar.gz"
    sha256 "c8fcac299d3516011773341ed3f6f2a1ebc052e2faa1d153a86372cada056a04"
  else
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.7.0/clawlight-v0.7.0-x86_64-apple-darwin.tar.gz"
    sha256 "6b45a556193f53530f6edfcffa79b3d14693645322352c957b6ccca1d49f545e"
  end

  def install
    bin.install "clawlight"
  end

  def caveats
    <<~EOS
      To install Claude Code hooks and start the menu bar daemon
      (LaunchAgent that runs at login), run:

        clawlight install

      The menu bar daemon will appear in your menu bar immediately
      and auto-start on subsequent logins.

      To remove everything:

        clawlight uninstall
    EOS
  end

  test do
    assert_match "clawlight",
      shell_output("#{bin}/clawlight --help")
  end
end
