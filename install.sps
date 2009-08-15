
(import (rnrs)

        (only (ikarus)
              current-directory
              system)
        
        (epcot core)
        (epcot registry))

(define (install-package name)

  (let ((entry (read-entry name)))

    (current-directory library-home)

    (if (file-exists? (symbol->string name))

        (display "Already installed\n")
        
        (begin

          (for-each install-package (entry-dependencies entry))

          (case (entry-backend entry)

            ((launchpad)
             (system (string-append "bzr branch "
                                    (entry-address entry))))
            
            ((git)
             (system (string-append "git clone "
                                    (entry-address entry))))

            ((http-tar-gz)

             (system (string-append "wget -O out.tar.gz " (entry-address entry)))

             (system "tar -xvzf out.tar.gz")

             (system "rm out.tar.gz")))))))

(install-package
 (string->symbol
  (list-ref (command-line) 1)))
