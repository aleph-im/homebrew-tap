class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.10.2"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.10.2/aleph-cli-macos-aarch64"
    sha256 "d43d8ccff4d43763159742b822790375f6414364f8f2d4e4cd1bb067b0f3c120"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.10.2/aleph-cli-macos-x86_64"
    sha256 "16215a1caef85e0fff71024d4f102d491abfb4d4dc94b0ee306dae6a120e1c1a"
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
