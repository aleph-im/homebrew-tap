class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.22.0"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.22.0/aleph-cli-macos-aarch64"
    sha256 "0cb4f0ce926273dabf29ae39d4b35c49fa7d4f939536294c7b98f684f3d011bc"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.22.0/aleph-cli-macos-x86_64"
    sha256 "06bb52c668cd391e102b7e7b61bfeeb30f767edc848252342a9104640c758639"
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
