
(library (epcot os misc)

  (export current-directory
          system
          getenv)

  (import (rnrs)
          (rename (mosh) (current-directory mosh:current-directory))
          (mosh process)
          (srfi :98))

  (define current-directory
    (case-lambda
     (()     (mosh:current-directory))
     ((path) (set-current-directory! path))))

  (define (system command)
    (waitpid
     (spawn "sh" (list "-c" command))))

  (define getenv get-environment-variable)

  )

  

  
          

