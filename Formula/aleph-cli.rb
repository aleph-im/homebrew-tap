class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.9.2"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.9.2/aleph-cli-macos-aarch64"
    sha256 "6e489655212473a82499cebfc5540a994231f6d25c561c2c14752867e07476a0"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.9.2/aleph-cli-macos-x86_64"
    sha256 "948330f29b0c85b612117a56e1bcce21c80c47fabc57cc198b800c0e5c38a233"
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
