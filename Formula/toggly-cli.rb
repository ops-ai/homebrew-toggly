class TogglyCli < Formula
  desc "Command-line interface for Toggly feature flag management"
  homepage "https://docs.toggly.io/sdks/cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ops-ai/Toggly.FeatureManagement/releases/download/cli-v0.4.0/toggly-cli-macos-arm64.tar.gz"
      sha256 "1094110a951ff1d3b7002efe6080a0b676a146bd311f4d28228b5ed1c8dbb9c5"
    else
      url "https://github.com/ops-ai/Toggly.FeatureManagement/releases/download/cli-v0.4.0/toggly-cli-macos-x64.tar.gz"
      sha256 "0fc7763927e751b7084b0483171e295ea79bfb4915663ac027cd7d04b1377ac9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ops-ai/Toggly.FeatureManagement/releases/download/cli-v0.4.0/toggly-cli-linux-arm64.tar.gz"
      sha256 "4ef5ed31b29fb59b4f969d5e8f15896b92bc3b77b7d83f8813b50661ca8c7327"
    else
      url "https://github.com/ops-ai/Toggly.FeatureManagement/releases/download/cli-v0.4.0/toggly-cli-linux-x64.tar.gz"
      sha256 "0bfbc625405475e64d441296274b8dbe67eab87d920cea808034e530645846b3"
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
