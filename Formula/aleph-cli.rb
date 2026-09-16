class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.19.0"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.19.0/aleph-cli-macos-aarch64"
    sha256 "0c882e7e978bf570c3a421065383af50d66f225f2b6e78531798b6614e0b63fc"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.19.0/aleph-cli-macos-x86_64"
    sha256 "f05d8f58db5feee9ee67797f9126af35b0adf87d67c1573d742956dd5a911f17"
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
