class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.14.0"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.14.0/aleph-cli-macos-aarch64"
    sha256 "130576cb96ef80ec140c7dbcd874a0f931ea622806a9b384812e0402eb3b9c50"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.14.0/aleph-cli-macos-x86_64"
    sha256 "953816697253aa92efa307f878d86b8240f7bb587e70c81984615bab1d045b80"
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
