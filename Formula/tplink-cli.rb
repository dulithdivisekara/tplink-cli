class TplinkCli < Formula
  desc "Universal TP-Link Router CLI & Network Optimization Suite"
  homepage "https://github.com/dulithdivisekara/tplink-cli"
  url "https://github.com/dulithdivisekara/tplink-cli/archive/refs/tags/v1.0.0.tar.gz"
  license "MIT"
  head "https://github.com/dulithdivisekara/tplink-cli.git", branch: "main"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/tplink-cli", "profile", "check", "--force"
  end
end
