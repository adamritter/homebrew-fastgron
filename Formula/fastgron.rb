class Fastgron < Formula
  desc "High-performance JSON to GRON converter"
  homepage "https://github.com/adamritter/fastgron"
  url "https://github.com/adamritter/fastgron/archive/refs/tags/v0.2.tar.gz"
  sha256 "ea39876d459493ab9876e33066b1868c5c9c22c88ce0b941717275371d434844"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/fastgron"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test fastgron`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
