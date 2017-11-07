;;;
;;; A fantasy domain created by Chris Martens
;;;
(define (domain hobbit)
  (:requirements :adl :domain-axioms :intentionality)
  (:types character place - object
          weapon - item)
  (:predicates (has ?character - character ?item - item)
               (alive ?character - character)
               (armed ?character - character)
               (at ?character - character ?place - place)
  )

  ;; A character travels from one place to another.
  (:action travel
    :parameters   (?character - character ?from - place ?to - place)
	:precondition (and (not (= ?from ?to))
                       (alive ?character)
                       (at ?character ?from))
	:effect       (and (not (at ?character ?from))
                       (at ?character ?to))
    :agents       (?character))


  ;; One character gives an item to another.
  (:action give
    :parameters   (?giver - character ?item - item ?receiver - character ?place - place)
	:precondition (and (not (= ?giver ?receiver))
                       (alive ?giver)
                       (at ?giver ?place)
                       (has ?giver ?item)
                       (alive ?receiver)
                       (at ?receiver ?place))
	:effect       (and (not (has ?giver ?item))
                       (has ?receiver ?item))
    :agents       (?giver ?receiver))

  
  ;; One character takes an item from another at weapon-point.
  (:action take
    :parameters   (?taker - character ?item - item ?victim - character ?place - place)
	:precondition (and (not (= ?taker ?victim))
                       (alive ?taker)
                       (at ?taker ?place)
                       (or (not (alive ?victim))
                           (and (armed ?taker)
                                (not (armed ?victim))))
                       (at ?victim ?place)
                       (has ?victim ?item))
	:effect       (and (not (has ?victim ?item))
                       (has ?taker ?item))
    :agents       (?taker))

;; opers to add:
;; wear ring/take ring off
;; get lost (moves to random adjacent place)
;; endanger, rescue from danger, escape from danger
;; tell passage (predicate: know that there is a passage from 1 place to
;;  another)
;; tell/learn weakness (smaug's missing piece in armor)
;;
;; goal: dragon dead, bilbo has arkenstone

)
