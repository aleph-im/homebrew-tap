class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.20.0"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.20.0/aleph-cli-macos-aarch64"
    sha256 "0b163a2652db206b679568494f3be40b7fa9a74a377bbbc6a9b219cf00b2ff38"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.20.0/aleph-cli-macos-x86_64"
    sha256 "761bc7e4f6e47a3bae934ce5cac5833fbad8e9e0f217767429ecae479d187d09"
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
