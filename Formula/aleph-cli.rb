class AlephCli < Formula
  desc "Minimal CLI for Aleph Cloud"
  homepage "https://github.com/aleph-im/aleph-rs"
  version "0.12.0"
  license "MIT"

  on_arm do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.12.0/aleph-cli-macos-aarch64"
    sha256 "58ec285658f054cadf11360d05b05fc2c769fa50834df212910f1282d7b4d159"
  end

  on_intel do
    url "https://github.com/aleph-im/aleph-rs/releases/download/v0.12.0/aleph-cli-macos-x86_64"
    sha256 "dc93ee55b9577a49ec0d04b6f4b945dff5a587bd204a49f6fd9983bdfcb5b0f7"
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
