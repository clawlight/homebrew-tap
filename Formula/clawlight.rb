class Clawlight < Formula
  desc "TUI dashboard and macOS menu bar indicator for Claude Code sessions"
  homepage "https://github.com/clawlight/clawlight-cli"
  version "0.11.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.11.0/clawlight-v0.11.0-aarch64-apple-darwin.tar.gz"
    sha256 "c221290db6b4caed2e8123decd5a16d414b338816fc73668c9df1e395a4a0f97"
  else
    url "https://github.com/clawlight/clawlight-cli/releases/download/v0.11.0/clawlight-v0.11.0-x86_64-apple-darwin.tar.gz"
    sha256 "57089c551a60b403eb6514ca93a3acba99d9c3e3d1a5beab2685fac248b80f4b"
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
