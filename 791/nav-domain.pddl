;;;
;;; A tiny domain created by Chris Martens
;;; Agents can move around the map, pick up keys, unlock doors, navigate to
;;;   targets.
;;;
(define (domain map-nav)
  (:requirements :adl :domain-axioms :intentionality)
  (:types character 
          key - item
          place)
  (:predicates (has ?character - character ?item - item)
               (at ?character - character ?place - place)
               (ati ?item - item ?place - place)
               (adjacent ?p1 - place ?p2 - place)
               (locked ?p1 - place ?p2 - place)
  )

  ;; A character travels from one place to another.
  (:action move
    :parameters   (?character - character ?from - place ?to - place)
	:precondition (and (not (= ?from ?to))
                       (at ?character ?from)
                       (adjacent ?from ?to))
	:effect       (and (not (at ?character ?from))
                       (at ?character ?to))
    :agents       (?character))


  ;; One character gives an item to another.
  (:action give
    :parameters   (?giver - character ?item - item ?receiver - character ?place - place)
	:precondition (and (not (= ?giver ?receiver))
                       (at ?giver ?place)
                       (has ?giver ?item)
                       (at ?receiver ?place))
	:effect       (and (not (has ?giver ?item))
                       (has ?receiver ?item))
    :agents       (?giver ?receiver))

  ;; Pick something up in the same room
  (:action pickup
    :parameters (?taker - character ?item - item ?place - place)
      :precondition (and (at ?taker ?place) (ati ?item ?place))
      :effect (and (not (ati ?item ?place)) (has ?taker ?item))
    :agents (?taker)    
  )

  (:action unlock
    :parameters (?unlocker - character ?key - key ?current - place ?new - place)
    :precondition (and (has ?unlocker ?key) 
                    (at ?unlocker ?current) 
                    (locked ?current ?new))
    :effect       (and (not (locked ?current ?new)) (not (locked ?new ?current)) 
                    (adjacent ?current ?new) (adjacent ?new ?current))

    :agents (?unlocker)
  )
  
)
