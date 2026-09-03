class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.18.1"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.18.1/aleph-cli-macos-aarch64"
    sha256 "affd67ad8b4a50ea0ab88bfb6fbe22f80bcc8822ce9f6bce28d956798979eacb"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.18.1/aleph-cli-macos-x86_64"
    sha256 "9157d87efe29b2bc2edd7bbde19d4090b96baddcf27e9f479565e7e955ce16ed"
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
