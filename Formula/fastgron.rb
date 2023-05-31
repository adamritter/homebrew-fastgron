class Fastgron < Formula
  desc "High-performance JSON to GRON converter"
  homepage "https://github.com/adamritter/fastgron"
  url "https://github.com/adamritter/fastgron/archive/refs/tags/v0.4.7.tar.gz"
  sha256 "ea77dd4a03ba6d66d020124e3d4652c4ec8f97a315d527aedf568992de76fbb3"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "ca-certificates"
  uses_from_macos "curl"
  depends_on "libnghttp2"
  depends_on "openssl@1.1"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/fastgron"
  end

  test do
    assert_match "fastgron", shell_output("#{bin}/fastgron --version 2>&1")
    assert_match "json[1] = 4;", shell_output("echo '[3,4,5]' | #{bin}/fastgron")
  end
end
