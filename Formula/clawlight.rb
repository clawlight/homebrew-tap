class Clawlight < Formula
  desc "TUI dashboard and macOS menu bar indicator for Claude Code sessions"
  homepage "https://github.com/clawlight/clawlight-cli"
  version "0.6.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.6.0/clawlight-v0.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "92f48559bc1abe5f99894184ecf4d3e3c11ef3e73a5869b58e094b6912071c9d"
  else
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.6.0/clawlight-v0.6.0-x86_64-apple-darwin.tar.gz"
    sha256 "37c256ef150399159c3a9a83664abdd05dd74389cccd7742971f49e553b967b5"
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
