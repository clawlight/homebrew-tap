class Clawlight < Formula
  desc "TUI dashboard and macOS menu bar indicator for Claude Code sessions"
  homepage "https://github.com/clawlight/clawlight-cli"
  version "0.9.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.9.0/clawlight-v0.9.0-aarch64-apple-darwin.tar.gz"
    sha256 "6a7175307b2361cf55acc23e457d9fcbe1c5273092cb50a7574f8be6e11ef045"
  else
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.9.0/clawlight-v0.9.0-x86_64-apple-darwin.tar.gz"
    sha256 "d03615ada392a7e30026547d8b6d94747aad05d15bd1ed8dc1cff42ed4470505"
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
