;;;
;;; A highly simplified problem for Indiana Jones and the Raiders of the Lost Ark
;;; Created by Stephen G. Ware
;;;
(define (problem get-ark)
  (:domain indiana-jones-ark)
  (:objects indiana nazis army - character
            usa tanis - place
            gun - weapon)
  (:init (burried ark tanis)
         (alive indiana)
         (at indiana usa)
         (knows-location indiana ark tanis)
         (alive army)
         (at army usa)
         (intends army (alive army))
         (intends army (has army ark))
         (alive nazis)
         (at nazis tanis)
         (intends indiana (at indiana tanis))
         (has nazis gun))
  (:goal (at indiana tanis)))
