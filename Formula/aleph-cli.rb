class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.8.3"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.8.3/aleph-cli-macos-aarch64"
    sha256 "5738420fb58f33f28f30edf3fc5120963fe691e6e0802dfa50bb97081864a74a"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.8.3/aleph-cli-macos-x86_64"
    sha256 "d7bc94d4781ded2f9ac209a924271c58df7430b149235765ab3a440c48c21f58"
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
