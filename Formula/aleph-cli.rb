class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.15.0"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.15.0/aleph-cli-macos-aarch64"
    sha256 "f652b007fdca9e37cf96bac1aefa7a54c9b6f632b3a197d8f286829203619134"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.15.0/aleph-cli-macos-x86_64"
    sha256 "b326db93225290b908b1168a31822a304026f43b21f3925119ea99d49da01685"
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
