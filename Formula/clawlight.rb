class Clawlight < Formula
  desc "TUI dashboard and macOS menu bar indicator for Claude Code sessions"
  homepage "https://github.com/clawlight/clawlight-cli"
  version "0.10.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.10.0/clawlight-v0.10.0-aarch64-apple-darwin.tar.gz"
    sha256 "384665706aae6e7711efe1822be5fcd72f708288d531197a6f485b46139daf09"
  else
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.10.0/clawlight-v0.10.0-x86_64-apple-darwin.tar.gz"
    sha256 "4442db526b55d7c065282bece5541fe814dd17ff073b0ffe1dcf90482a231856"
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
