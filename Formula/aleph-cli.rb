class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.13.2"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.13.2/aleph-cli-macos-aarch64"
    sha256 "ed5fcf5ecf7bce26bcb9d72ada751d1eece25fdacf1ebb8a91c43a7bfc8fa8a4"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.13.2/aleph-cli-macos-x86_64"
    sha256 "3878111793129fc07209beabd920cccac8cb91870e8fee8477f7c445b1523d1c"
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
