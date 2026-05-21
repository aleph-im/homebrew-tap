class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.10.0"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.10.0/aleph-cli-macos-aarch64"
    sha256 "de2c0dca83903776d02c2afdb9cfaea03a13efcb4339b78c4f95ad74ac6072f8"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.10.0/aleph-cli-macos-x86_64"
    sha256 "1f787f3964b2873347574dd7b81c5d6ed02354a2f83155d9308dc42d23737d9a"
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
