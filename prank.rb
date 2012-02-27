require 'formula'

class Prank < Formula
  head 'https://code.google.com/p/prank-msa', :using => :git
  url 'http://prank-msa.googlecode.com/files/prank.src.111130.tgz'
  md5 '5de86002269edaeaebd2921e67d95007'
  version '111130'
  homepage 'http://www.ebi.ac.uk/goldman-srv/prank/'

  def install
    cd "src/" do 
      system "make"
      bin.install "prank"
      man.install "prank.1"
    end

  end

  def test
    system "prank"
  end
end
