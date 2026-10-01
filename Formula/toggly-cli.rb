class TogglyCli < Formula
  desc "Official Toggly CLI for feature flags, environments, and releases"
  homepage "https://docs.toggly.io/sdks/cli"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ops-ai/Toggly.FeatureManagement/releases/download/cli-v0.4.1/toggly-cli-macos-arm64.tar.gz"
      sha256 "a8d18dd796d04f2730ad19ab330b0ecb012555ce42982e953458d90336399875"
    else
      url "https://github.com/ops-ai/Toggly.FeatureManagement/releases/download/cli-v0.4.1/toggly-cli-macos-x64.tar.gz"
      sha256 "d3b63d6835fde79761c7ac00f46fbe177afa298f22e33a3e398871f3c3731985"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ops-ai/Toggly.FeatureManagement/releases/download/cli-v0.4.1/toggly-cli-linux-arm64.tar.gz"
      sha256 "fbb0c19ea6cbbbd15221dbef59fca3a1dac1cc270e79e5b8664e80cd401bba1e"
    else
      url "https://github.com/ops-ai/Toggly.FeatureManagement/releases/download/cli-v0.4.1/toggly-cli-linux-x64.tar.gz"
      sha256 "82ad237be8a2923e444baeda00ea7dc568ed30969d84d7b39a9a3d9b913db79d"
    end
  end

  def install
    # Archives ship the binary as `toggly-cli`; install it on PATH as `toggly`
    # per the Wave 5 UX lock (docs/man reference `toggly`).
    bin.install "toggly-cli" => "toggly"
    man1.install Dir["man/*.1"] if File.directory?("man")
  end

  def caveats
    <<~EOS
      The binary is installed as `toggly` (not `toggly-cli`).

        toggly auth login
        toggly app list

      Docs: https://docs.toggly.io/sdks/cli
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toggly --version")
  end
end
