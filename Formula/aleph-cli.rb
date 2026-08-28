class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.17.0"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.17.0/aleph-cli-macos-aarch64"
    sha256 "8c39c1013f77dd025d576cfae0e078e94b236ba68191e28900f8cab1ac7c6be5"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.17.0/aleph-cli-macos-x86_64"
    sha256 "b0a4d01061a4effe374b73642f4bae4c6ac2e6ad5db20b0b9b842267939a2e28"
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
