class Curie < Formula
  desc "CLI for the Curie scientific AI platform — run biology, chemistry, and physics models from your terminal"
  homepage "https://curie.sh"
  url "https://github.com/curieapi/cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d7402357eba30eabfeeb4b330dca6ff97ea0e665c22df85948da153b75b1eef2"
  license "MIT"

  depends_on "python@3.11"

  def install
    virtualenv_create(libexec, "python3.11")
    system libexec/"bin/pip", "install", "--verbose", buildpath
    bin.install_symlink libexec/"bin/curie"
  end

  test do
    assert_match "Curie", shell_output("#{bin}/curie --help")
  end
end
