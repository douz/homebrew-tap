class MacMotd < Formula
  desc "Modular zsh MOTD for macOS"
  homepage "https://github.com/douz/mac-motd"
  url "https://github.com/douz/mac-motd/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "0a4f8b7c405559ad0641d2113400284a562189d88fe8f5ab6231efaf72ca045a"
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
