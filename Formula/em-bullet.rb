require 'formula'

class EmBullet < Formula
  homepage 'http://bulletphysics.org/wordpress/'
  url 'https://bullet.googlecode.com/files/bullet-2.82-r2704.tgz'
  version '2.82'
  sha1 'a0867257b9b18e9829bbeb4c6c5872a5b29d1d33'
  head 'http://bullet.googlecode.com/svn/trunk/'

  depends_on 'cmake' => :build
  depends_on 'emscripten' => :build

  def install
    args = []

    args << "-DBUILD_DEMOS=OFF" << "-DBUILD_EXTRAS=OFF" << "-DBUILD_CPU_DEMOS=OFF" << "-DUSE_GLUT=OFF" << "-DUSE_GRAPHICAL_BENCHMARK=OFF"
    args << "-DCMAKE_TOOLCHAIN_FILE=/usr/local/Cellar/emscripten/1.27.0/libexec/cmake/Modules/Platform/Emscripten.cmake"

    system "cmake", *args
    system "make"
    system "make install"
  end
end
