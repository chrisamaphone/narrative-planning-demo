;;;
;;; Map navigation problem
;;;
(define (problem map-nav-coop)
  (:domain map-nav)
  (:objects purple green - character
            l1 l2 l3 l4 l5 l6 l7 - place
            k - key)
  (:init (adjacent l1 l2) (adjacent l2 l1)
         (locked l2 l3)
         (adjacent l3 l4) (adjacent l4 l3)
         (adjacent l4 l7) (adjacent l7 l4)
         (adjacent l3 l6) (adjacent l6 l3)
         (locked l6 l5)
         (at green l1) (at purple l6)
         (ati k l2)
         (intends purple (at purple l5))
         (intends green (at green l7))
  )
  ;; (:goal (and (at purple l5) (at green l7)))
  (:goal (and (at purple l3) (at green l2)))
)
