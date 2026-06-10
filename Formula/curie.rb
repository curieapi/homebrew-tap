class Curie < Formula
  desc "CLI for the Curie scientific AI platform — run biology, chemistry, and physics models from your terminal"
  homepage "https://curie.sh"
  url "https://github.com/curieapi/curie-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
