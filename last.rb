require 'formula'

class Last < Formula
  homepage 'http://last.cbrc.jp/'
  url 'http://last.cbrc.jp/archive/last-193.zip'
  md5 '48cc00b4418a44044988efe360595c8e'

  def install
    cd "src"
    system "make"
    %w{lastex lastal lastdb}.each do |exe|
      bin.install exe
    end
  end

  def test
    system "lastex"
    system "lastal"
    system "lastdb"
  end
end
