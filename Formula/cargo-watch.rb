class CargoWatch < Formula
  desc "Watches over your Cargo project's source"
  homepage "https://github.com/passcod/cargo-watch"
  url "https://github.com/passcod/cargo-watch/archive/v7.8.0.tar.gz"
  sha256 "9816b102e61c4257d6052ef4b196f67f40bab69143899f0178b5ccd9a29d384e"
  license "CC0-1.0"
  head "https://github.com/passcod/cargo-watch.git"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "a41457079f156fbf5a53d6037c6cdf92c6c644d00392a923f85d16bbd7b769f8"
    sha256 cellar: :any_skip_relocation, big_sur:       "789c2ef8304a9e8149bf19fe19e596452680fdb765f89f47e6e2d4f7f4d773ac"
    sha256 cellar: :any_skip_relocation, catalina:      "2b4795d6ccfd29eec17e9199867683dc77977b43e7178936fbf205e123be68d3"
    sha256 cellar: :any_skip_relocation, mojave:        "ecaaebdc7c44594390ae2bc9067f96e691357d5bd96ec17cfa2db248b22cf0a4"
  end

  depends_on "rust" => [:build, :test]

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/cargo-watch -x build 2>&1", 1)
    assert_match "error: project root does not exist", output

    assert_equal "cargo-watch #{version}", shell_output("#{bin}/cargo-watch --version").strip
  end
end
