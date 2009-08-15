
(import (rnrs)

        (only (ikarus)
              current-directory
              system)
        
        (epcot core)
        (epcot registry))

(define (install-package name)

  (let ((entry (find (lambda (entry)
                       (eq? (entry-name entry) name))
                     epcot-registry)))

    (case (entry-backend entry)

      ((launchpad)
       (current-directory library-home)
       (system (string-append "bzr branch "
                              (entry-address entry))))
       
      ((git)
       (for-each install-package (entry-dependencies entry))
       (current-directory library-home)
       (system (string-append "git clone "
                              (entry-address entry)))))))

(install-package
 (string->symbol
  (list-ref (command-line) 1)))
