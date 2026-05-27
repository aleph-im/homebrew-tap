class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.10.3"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.10.3/aleph-cli-macos-aarch64"
    sha256 "0025b4bc27f4dbab1375140aedfa80610438dec05fab05afb9f84e36d67b8b32"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.10.3/aleph-cli-macos-x86_64"
    sha256 "d47394f10cc7025ba40a0b3c2e8b25930b1045e7594eaf8f092511f86d94ea44"
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
