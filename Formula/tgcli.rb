class Tgcli < Formula
  desc "Telegram CLI tool using grammers (pure Rust MTProto)"
  homepage "https://github.com/dgrr/tgcli"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-darwin-arm64"
      sha256 "07e3d75a2425a8c2987e49393811ea2f884755668a234e9191b4ed4bbe102c50"
    end
    on_intel do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-darwin-amd64"
      sha256 "bbd9e52b2acc000404e8ee47ab1fe71d2f59035bab67a7de46108161732bf1cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-linux-arm64"
      sha256 "4fb232f3c53d01305b3b633cbb34e1b5f054b301e6181a0b8fa2b80918cc9549"
    end
    on_intel do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-linux-amd64"
      sha256 "6068414b10a5c4df8ff855cd4d7de25a78744f1835b45c12acd6a9ef482258a9"
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
