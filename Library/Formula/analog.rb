require 'formula'

class Analog < Formula
  homepage 'http://analog.cx'
  url 'http://analog.cx/analog-6.0.tar.gz'
  sha1 '17ad601f84e73c940883fb9b9e805879aac37493'

  depends_on 'gd'
  depends_on 'jpeg'
  depends_on :libpng

  def install
    system "make", "LANGDIR=#{share}/analog/lang/"
    bin.install 'analog'
    system "mkdir -p #{share}/analog"
    (share/'analog').install 'examples', 'how-to', 'images', 'lang'
    (share/'analog').install 'analog.cfg' => 'analog.cfg-dist'
    man1.install "analog.man" => "analog.1"
  end

  def test
    system "#{bin}/analog > /dev/null"
  end
end
