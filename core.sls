
(library (epcot core)

  (export make-entry
          entry-name
          entry-backend
          entry-address
          entry-dependencies
          library-home
          )

  (import (rnrs))

  (define-record-type entry
    (fields name backend address dependencies))

  (define library-home "/usr/local/lib/scheme")

  )

  