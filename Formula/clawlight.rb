class Clawlight < Formula
  desc "TUI dashboard and macOS menu bar indicator for Claude Code sessions"
  homepage "https://github.com/clawlight/clawlight-cli"
  version "0.8.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.8.0/clawlight-v0.8.0-aarch64-apple-darwin.tar.gz"
    sha256 "121fd76af56265a61aae9ac56df34d7618689a8341915c7d6dc0f260e1e8155c"
  else
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.8.0/clawlight-v0.8.0-x86_64-apple-darwin.tar.gz"
    sha256 "9829ecd2a14becaed2fafbfd9819ebff1da54ff50e67459c771a68ba5535d275"
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
