class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.18.0"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.18.0/aleph-cli-macos-aarch64"
    sha256 "d20513a14602fbf1c8468de141f26effc50c40a89d6703b119b110fb8d1e5f85"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.18.0/aleph-cli-macos-x86_64"
    sha256 "72f44bf001bf246bb87733f97ad77b2f1d0362fa6d9b8ce833cb497a8f8e7f77"
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
