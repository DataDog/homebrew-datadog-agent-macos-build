class CmakeAT31822 < Formula
  # This is a modified version of the 3.18.2 cmake formula which doesn't depend on
  # sphinx-doc, as the sphinx-doc build fails with:
  # "Given no hashes to check 169 links for project 'pip': discarding no candidates"
  # in the Github Actions builder,
  # and sphinx-doc is only used to generate cmake documentation
  desc "Cross-platform make"
  homepage "https://www.cmake.org/"
  url "https://github.com/Kitware/CMake/releases/download/v3.18.2/cmake-3.18.2.tar.gz"
  sha256 "5d4e40fc775d3d828c72e5c45906b4d9b59003c9433ff1b36a1cb552bbd51d7e"
  license "BSD-3-Clause"
  head "https://gitlab.kitware.com/cmake/cmake.git"

  livecheck do
    url "https://cmake.org/download/"
    regex(/Latest Release \(v?(\d+(?:\.\d+)+)\)/i)
  end

  on_linux do
    depends_on "openssl@1.1"
  end

  # The completions were removed because of problems with system bash

  # The `with-qt` GUI option was removed due to circular dependencies if
  # CMake is built with Qt support and Qt is built with MySQL support as MySQL uses CMake.
  # For the GUI application please instead use `brew cask install cmake`.

  def install
    args = %W[
      --prefix=#{prefix}
      --no-system-libs
      --parallel=#{ENV.make_jobs}
      --datadir=/share/cmake
      --docdir=/share/doc/cmake
      --mandir=/share/man
      --system-zlib
      --system-bzip2
      --system-curl
    ]

    system "./bootstrap", *args, "--", *std_cmake_args,
                                       "-DCMake_INSTALL_EMACS_DIR=#{elisp}"
    system "make"
    system "make", "install"
  end

  test do
    (testpath/"CMakeLists.txt").write("find_package(Ruby)")
    system bin/"cmake", "."
  end
end
