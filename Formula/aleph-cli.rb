class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.8.2"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.8.2/aleph-cli-macos-aarch64"
    sha256 "a085bef87c7aa5af6709f46b6a4fcb5ed8cfc8d7a5b3ec184d7ec88f5ca7641d"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.8.2/aleph-cli-macos-x86_64"
    sha256 "fa1b8044e25a7bb19f4e608df68715834eec313c4efb12647103c53cce3cd00a"
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
