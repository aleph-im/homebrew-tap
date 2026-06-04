class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.11.0"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.11.0/aleph-cli-macos-aarch64"
    sha256 "891933806f5baaebb00939b0fb460fd39990b2eba47f338f171ccc56b1dac9ae"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.11.0/aleph-cli-macos-x86_64"
    sha256 "18716edf3d58478646fd460921d7935ce61825cca14e15392ef626d53aa5bc4b"
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
