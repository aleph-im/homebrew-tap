class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.21.0"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.21.0/aleph-cli-macos-aarch64"
    sha256 "dbae0493f48920f52fbf09cbc1a6b8856a46f375fb8e13785b4d00b25fae9c17"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.21.0/aleph-cli-macos-x86_64"
    sha256 "e088cb9beb524492a50b6b77bd7f23fdacfa8f15e73a700c628d9df18638ab5b"
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
