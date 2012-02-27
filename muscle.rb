require 'formula'

class MuscleHttpDownloadStrategy < CurlDownloadStrategy                                                                                                                                                                                    
  def stage                                                                                                                                                                                                                                   
    puts "OK"
    safe_system '/usr/bin/tar', 'xvf', @tarball_path                                                                                                                                                                                      
    chdir                                                                                                                                                                                                                                     
    %w{src/globalsosx.cpp}.each do |badfile|
            system "tr -d '\r' < #{badfile} > #{badfile}2"
            safe_system "mv",badfile+"2",badfile
    end
  end                                                                                                                                                                                                                                         
end   

class Muscle < Formula
  url 'http://www.drive5.com/muscle/downloads3.8.31/muscle3.8.31_src.tar.gz', :using => MuscleHttpDownloadStrategy
  homepage 'http://www.drive5.com/muscle/'
  md5 'f767f00fd15f0c5db944d41936779e10'
  version '3.8.31'

  def patches
         DATA
  end
  def install
    Dir.chdir "src"
    system "make"
    bin.install "muscle"
  end
end


__END__
diff -rupN a/src/globalsosx.cpp b/src/globalsosx.cpp
--- a/src/globalsosx.cpp        2012-02-21 10:41:44.000000000 +0000
+++ b/src/globalsosx.cpp        2012-02-21 10:42:48.000000000 +0000
@@ -13,10 +13,10 @@
 #include <netinet/icmp6.h>
 #include <sys/vmmeter.h>
 #include <sys/proc.h>
+#include <mach/vm_statistics.h>
 #include <mach/task_info.h>
 #include <mach/task.h>
 #include <mach/mach_init.h>
-#include <mach/vm_statistics.h>
 
 const double DEFAULT_RAM = 1e9;
 const double DEFAULT_MEM_USE = 1e6;
