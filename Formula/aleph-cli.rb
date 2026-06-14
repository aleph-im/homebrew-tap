class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.13.1"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.13.1/aleph-cli-macos-aarch64"
    sha256 "27ba6f832964706706853b9935affc79ca7cc3aec1e067b05615b4be68c2a02b"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.13.1/aleph-cli-macos-x86_64"
    sha256 "f302a51b74be8cd2dedcf418d39f646bca4130b8435d2eeec7b3b01de606d8ac"
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
