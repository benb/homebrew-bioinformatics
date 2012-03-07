require 'formula'

class Sap < Formula
  homepage 'http://mathbio.nimr.mrc.ac.uk/wiki/Software#SAP'
  url 'http://mathbio.nimr.mrc.ac.uk/download/SAP/sap-1.1.1.tar.gz'
  md5 '803461a8df1b9d3b7298bbbd0a406b91'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just
    # replace "false" with the main program this formula installs, but
    # it'd be nice if you were more thorough. Test the test with
    # `brew test sap`. Remove this comment before submitting
    # your pull request!
    "sap"
  end
  def patches
    #if we include malloc.h, the build fails
    DATA
  end
end
__END__
diff --git a/src/galloc.h b/src/galloc.h
index 903807b..32251cb 100644
--- a/src/galloc.h
+++ b/src/galloc.h
@@ -9,8 +9,6 @@
 
 /* ---- STANDARD HEADERS ---- */
 
-#include <malloc.h>
-
 /* ---- MACROS ---- */
 
 #define G_MALLOC(PTR, TYPE) (PTR)=(TYPE*) malloc(sizeof(TYPE))
diff --git a/src/pdbprot.c b/src/pdbprot.c
index 09527e0..7007857 100644
--- a/src/pdbprot.c
+++ b/src/pdbprot.c
@@ -8,7 +8,6 @@
 
 #include <stdio.h>
 #include <stdlib.h>
-#include <malloc.h>
 #include <string.h>
 #include <math.h>
 #include <assert.h>

