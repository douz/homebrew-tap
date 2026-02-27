class MacMotd < Formula
  desc "Modular zsh MOTD for macOS"
  homepage "https://github.com/douz/mac-motd"
  url "https://github.com/douz/mac-motd/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1b082b61b017b348fbe342296e73148b21507533286e99cf623cdabe1d1831f2"
  license "MIT"

  depends_on "figlet"
  depends_on "ical-buddy"
  depends_on "osx-cpu-temp"
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
