class Fastgron < Formula
  desc "High-performance JSON to GRON converter"
  homepage "https://github.com/adamritter/fastgron"
  url "https://github.com/adamritter/fastgron/archive/refs/tags/v0.4.5.tar.gz"
  sha256 "6121c20b3795618b25a0f5a1aa199dfe95faf824b29cba7f701e0bf42d8fb04e"
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
