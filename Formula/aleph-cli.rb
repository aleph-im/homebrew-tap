class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.8.4"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.8.4/aleph-cli-macos-aarch64"
    sha256 "bd5dd5ed65414a4e97bba720a8ffec429ba3f8f9ecfa85c05815daf3e14c459b"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.8.4/aleph-cli-macos-x86_64"
    sha256 "80f183ca97e204d74f9581fb96950cac3dc53481c8af0a784945ea45b5ed043e"
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
