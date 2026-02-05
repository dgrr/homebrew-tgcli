class Tgcli < Formula
  desc "Telegram CLI tool using grammers (pure Rust MTProto)"
  homepage "https://github.com/dgrr/tgcli"
  version "0.2.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-darwin-arm64"
      sha256 "be95d5ae8fc6974319365216af188c53d9cb32a9167eec4c798c3bcb5ae08888"
    end
    on_intel do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-darwin-amd64"
      sha256 "d72172cea35a4691cf2cb94ed954171cb90c15a8ebc7d881c0e704a53f2db4e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-linux-arm64"
      sha256 "da3db4eae071f5c6c681993a0c2142b7b351bb79382af391181abbebc0275b66"
    end
    on_intel do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-linux-amd64"
      sha256 "8a314d4150b3248a6d6e2104e947763f96309ac4b0612d58ff789270bc0a1d70"
    end
  end

  def install
    binary = Dir["tgcli-*"].first || "tgcli"
    bin.install binary => "tgcli"
  end

  def caveats
    <<~EOS
      If you have a tgcli sync service running, restart it to use the new version:
        launchctl kickstart -k gui/$(id -u)/com.tgcli.sync

      Or manually:
        launchctl stop com.tgcli.sync
        launchctl start com.tgcli.sync
    EOS
  end

  test do
    assert_match "tgcli", shell_output("#{bin}/tgcli --version")
  end
end
