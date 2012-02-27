require 'formula'

class Probcons < Formula
  homepage ''
  url 'http://probcons.stanford.edu/probcons_v1_12.tar.gz'
  md5 'a658e24b07aaa9e8194317345133ac9d'


  def install
    system "make"
    bin.install "probcons"
    %w{compare project makegnuplot}.each do |f|
            mv f, "probcons-#{f}"
            bin.install "probcons-#{f}"
    end
  end

  def test
    system "probcons"
  end

end
