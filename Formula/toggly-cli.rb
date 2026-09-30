class TogglyCli < Formula
  desc "Command-line interface for Toggly feature flag management"
  homepage "https://docs.toggly.io/sdks/cli"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ops-ai/Toggly.FeatureManagement/releases/download/cli-v0.3.2/toggly-cli-macos-arm64.tar.gz"
      sha256 "1c3a5862376da98d3a0a5caf9d567f33c59805a9fc7690c7e4d83219b42069bd"
    else
      url "https://github.com/ops-ai/Toggly.FeatureManagement/releases/download/cli-v0.3.2/toggly-cli-macos-x64.tar.gz"
      sha256 "9d6b6fdc9481ecfb6749710802f947352c8c2df7855542ef8ef5ec91a6a3b508"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ops-ai/Toggly.FeatureManagement/releases/download/cli-v0.3.2/toggly-cli-linux-arm64.tar.gz"
      sha256 "7ed64bcecd95f4b158f8d9710941eeb8822a63a83fdd52f18d5b29ced900364c"
    else
      url "https://github.com/ops-ai/Toggly.FeatureManagement/releases/download/cli-v0.3.2/toggly-cli-linux-x64.tar.gz"
      sha256 "d63b1acb5256bdb3438622d1a07c854e13302a974d34e2236ee58b56bc855d8b"
    end
  end

  def install
    # Archives ship the binary as `toggly-cli`; install it on PATH as `toggly`
    # per the Wave 5 UX lock (docs/man reference `toggly`).
    bin.install "toggly-cli" => "toggly"
    man1.install Dir["man/*.1"] if File.directory?("man")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toggly --version")
  end
end
