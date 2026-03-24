class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.8.1"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.8.1/aleph-cli-macos-aarch64"
    sha256 "0acaa98e7518f112b2e47bfe9a1f7f7dab64434b15c91d5d6b428cf956376a51"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.8.1/aleph-cli-macos-x86_64"
    sha256 "bc0bb81a4051ead8f4c9dc1ee96ff53f74b14de72b49f77a37260d5d5a873835"
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
