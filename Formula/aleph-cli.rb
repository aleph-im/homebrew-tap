class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.11.1"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.11.1/aleph-cli-macos-aarch64"
    sha256 "223acc6e07c3cc41ecdb36f5d97ad42ce7ff4f671ac224a2449bfb1aba06b471"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.11.1/aleph-cli-macos-x86_64"
    sha256 "23eb49cd62c946d726fd6ac5d54863692ad14505eb1427b018078809f1270cd1"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "aleph-cli-macos-aarch64" => "aleph"
    else
      bin.install "aleph-cli-macos-x86_64" => "aleph"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aleph --version")
  end
end
