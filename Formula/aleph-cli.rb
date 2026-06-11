class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.13.0"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.13.0/aleph-cli-macos-aarch64"
    sha256 "453e0ffec7bf8fd7b14131a886f63af1159c342eca9902b40598e25d6d91c7d8"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.13.0/aleph-cli-macos-x86_64"
    sha256 "f13e57d66eec785cb81b89123668c67309fd4e2783a1cc9ca408fe1f0c8e30da"
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
