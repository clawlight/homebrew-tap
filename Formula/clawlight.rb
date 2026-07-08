class Clawlight < Formula
  desc "TUI dashboard and macOS menu bar indicator for Claude Code sessions"
  homepage "https://github.com/clawlight/clawlight-cli"
  version "0.10.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.10.1/clawlight-v0.10.1-aarch64-apple-darwin.tar.gz"
    sha256 "5d33560aa80b5f115a515ee80576cb6006461a0990ec730314366c6e49de565b"
  else
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.10.1/clawlight-v0.10.1-x86_64-apple-darwin.tar.gz"
    sha256 "229e759307675f23f56797349e0b8194e9441b5d640d948367693869d1977262"
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
