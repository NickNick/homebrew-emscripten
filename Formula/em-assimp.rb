require "formula"

class EmAssimp < Formula
  head "https://github.com/assimp/assimp.git"

  depends_on "cmake" => :build
  depends_on "emscripten" => :build

  def install
    args = []
    args << "-DASSIMP_BUILD_ASSIMP_TOOLS=OFF" # Not needed
    args << "-DASSIMP_BUILD_TESTS=OFF" # This uses threads, which we don't have in emscripten.
    args << "-DBUILD_SHARED_LIBS=OFF"
    args << "-DCMAKE_C_FLAGS=-Wno-implicit-function-declaration" # Necessary to compile internal zlib
    args << "-DCMAKE_CXX_FLAGS=-Wno-implicit-function-declaration" # Necessary to compile internal zlib
    system "cmake", ".", "-DCMAKE_TOOLCHAIN_FILE=/usr/local/Cellar/emscripten/1.28.0/libexec/cmake/Modules/Platform/Emscripten.cmake", *args
    system "make", "install"
  end

end
