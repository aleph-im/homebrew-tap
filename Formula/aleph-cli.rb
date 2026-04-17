class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.9.1"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.9.1/aleph-cli-macos-aarch64"
    sha256 "2322193589e2cee4a7b90d9e125754b15f7e4cb3f7cf56e91f3c2a831b0f1cbe"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.9.1/aleph-cli-macos-x86_64"
    sha256 "852a8e0595c9aa81d8df61a61c985c59e04d5c7ba9d838d1b67f1b6b94649fa2"
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
