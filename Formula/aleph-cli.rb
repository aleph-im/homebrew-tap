class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.10.1"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.10.1/aleph-cli-macos-aarch64"
    sha256 "dccb21bbbb3a4fcc3c7955546beaf105aea062c3bb52abbdb58cc85bc713cd72"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.10.1/aleph-cli-macos-x86_64"
    sha256 "a7bbe3492c5770b0623f5bf6a485aaf138fffa2768aaf703aa2305c7f41178dd"
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
