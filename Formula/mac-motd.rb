class MacMotd < Formula
  desc "Modular zsh MOTD for macOS"
  homepage "https://github.com/douz/mac-motd"
  url "https://github.com/douz/mac-motd/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "bce03bfa4049e9bff4d9ec7deb3b936a9bd42ded91a872663e0a99b2b13f487a"

  license "MIT"

  depends_on "figlet"
  depends_on "ical-buddy"
  depends_on "ismc"
  depends_on "jq"
  depends_on "smartmontools"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/mac-motd" => "mac-motd"
  end

  def caveats
    <<~EOS
      Run:
        mac-motd install

      This creates user config at:
        ~/.douz.io/motd_config.zsh

      To refresh the config template safely:
        mac-motd install --refresh-config

      To uninstall:
        mac-motd uninstall
      or remove config too:
        mac-motd uninstall --purge-config
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/mac-motd", 1)
  end
end
