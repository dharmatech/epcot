
(library (epcot registry)

  (export read-entry)

  (import (rnrs)
          (epcot core))

  (define epcot-registry-location "/usr/local/lib/scheme/epcot/registry")

  (define (read-entry name)

    (apply make-entry

           (call-with-input-file (string-append epcot-registry-location
                                                "/"
                                                (symbol->string name))
             read)))

  )
