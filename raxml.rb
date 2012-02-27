require 'formula'

class Raxml < Formula
  homepage 'http://sco.h-its.org/exelixis/software.html'
  url 'http://sco.h-its.org/exelixis/countSource728.php'
  md5 'de658ee18049e178744b4759adb286da'

  # depends_on 'cmake' => :build

  def install
    #make both threaded and unthreaded versions
    system "make -f Makefile.SSE3.gcc"
    system "make -f Makefile.SSE3.PTHREADS.gcc clean"
    system "make -f Makefile.SSE3.PTHREADS.gcc"
    bin.install "raxmlHPC-SSE3"
    bin.install "raxmlHPC-PTHREADS-SSE3"
  end

  def test
    system "raxmlHPC-SSE3"
    system "raxmlHPC-PTHREADS-SSE3"
  end
end
