class Fastgron < Formula
  desc "High-performance JSON to GRON converter"
  homepage "https://github.com/adamritter/fastgron"
  url "https://github.com/adamritter/fastgron/archive/refs/tags/v0.4.6.tar.gz"
  sha256 "eba5ca3ec5a1c2321d82ce0e07a4b507bd9ce5ee9b8a2719c3811f63978b6085"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "curl"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/fastgron"
  end

  test do
    assert_match "fastgron", shell_output("#{bin}/fastgron --version")
    assert_match "json[1] = 4;", shell_output("echo '[3,4,5]' | #{bin}/fastgron")
  end
end
