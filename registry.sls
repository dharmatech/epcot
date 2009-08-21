
(library (epcot registry)

  (export read-entry)

  (import (rnrs)
          (epcot os misc)
          (epcot core))

  (define registry-location "/usr/local/lib/scheme/epcot/registry")

  (define (get-registry-location)
    (or (getenv "EPCOT_REGISTRY")
        registry-location))

  (define (read-entry name)

    (apply make-entry

           (call-with-input-file (string-append (get-registry-location)
                                                "/"
                                                (symbol->string name))
             read)))

  )
