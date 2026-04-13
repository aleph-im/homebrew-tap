class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.9.0"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.9.0/aleph-cli-macos-aarch64"
    sha256 "eb64dc63696fde3a52bf22001c34084d2f768ffdb5ea72a8949075660609476b"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.9.0/aleph-cli-macos-x86_64"
    sha256 "17a0d8e8e40dc9b78c395ca735b97f99308afe939b506b34a6b67780525b2ee7"
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
