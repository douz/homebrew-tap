class MacMotd < Formula
  desc "Modular zsh MOTD for macOS"
  homepage "https://github.com/douz/mac-motd"
  url "https://github.com/douz/mac-motd/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "9979224b2b50098ae011c036a80d1af94f2855ae0c24d4cb92729d3632f5f588"
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
