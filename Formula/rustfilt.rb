class Rustfilt < Formula
  desc "Demangle Rust symbols like c++filt does for C++"
  homepage "https://github.com/luser/rustfilt"
  url "https://github.com/luser/rustfilt/archive/0.2.1.tar.gz"
  sha256 "f09bb822c8b22c4c89bf63cc64f8f85a053e1850a70cad4b7308e00871527496"

  bottle do
    root_url "https://github.com/luser/rustfilt/releases/download/0.2.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, big_sur: "692953e844b5728246443bd2faec687a17caa2c694209a2219614c041fb68226"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked",
                               "--root", prefix,
                               "--path", "."
  end

  test do
    assert_equal "mycrate::foo::bar::baz", shell_output("#{bin}/rustfilt _RNvNtNtCs1234_7mycrate3foo3bar3baz").strip
  end
end
