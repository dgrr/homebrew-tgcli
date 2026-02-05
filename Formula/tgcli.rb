class Tgcli < Formula
  desc "Telegram CLI tool using grammers (pure Rust MTProto)"
  homepage "https://github.com/dgrr/tgcli"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-darwin-arm64"
      sha256 "45ffef5266f1dcae812600ae6e8eadd2942096f93fbfe28d218beac13d6010ca"
    end
    on_intel do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-darwin-amd64"
      sha256 "45ffef5266f1dcae812600ae6e8eadd2942096f93fbfe28d218beac13d6010ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-linux-arm64"
      sha256 "45ffef5266f1dcae812600ae6e8eadd2942096f93fbfe28d218beac13d6010ca"
    end
    on_intel do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-linux-amd64"
      sha256 "45ffef5266f1dcae812600ae6e8eadd2942096f93fbfe28d218beac13d6010ca"
    end
  end

  def install
    binary = Dir["tgcli-*"].first || "tgcli"
    bin.install binary => "tgcli"
  end

  test do
    assert_match "tgcli", shell_output("#{bin}/tgcli --version")
  end
end
