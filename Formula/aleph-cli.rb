class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.16.0"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.16.0/aleph-cli-macos-aarch64"
    sha256 "7039d1586e50d0c95d474f640d1abbd8b10dbcae0c1f84e233cb9abece4edf59"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.16.0/aleph-cli-macos-x86_64"
    sha256 "47fc0de22a07764fc47c07299a72d080191095fe762bffb6073738ced95f6b53"
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
