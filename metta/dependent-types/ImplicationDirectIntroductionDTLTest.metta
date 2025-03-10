;; Test Implication Direct Introduction DTL Rule

;; Import modules
!(import! &self ImplicationDirectIntroductionDTL.metta)
;; !(import! &self ../common/In.metta)  ; NEXT
!(import! &self ../synthesis/Synthesize.metta)
;; !(import! &self ../common/Record.metta)

;; Knowledge base
(: kb (-> Atom))
(= (kb) (superpose ((: P42 (≘ P 42 True))
                    (: Q42 (≘ Q 42 False)))))
;; All axioms are placed in the kb as well
(= (kb) (implication-direct-introduction-axiom))
(= (kb) (: NothingInEmpty (∉ $x ∅))) ; NEXT: replace by (nothing-in-empty-axiom))

;; Rule base
(: rb (-> Atom))
(= (rb) (implication-direct-introduction-rule))

;; Test axiom
! "===== Test axiom ====="
(: axiom_prf (≞ (→ P Q) (ETV ∅ (STV 1 0))))
(= axiom_prf IDIAxiom)
!(axiom_prf)
!(get-type axiom_prf)

;; Test inductive rule
;;
;; Build the following inference tree
;;
;; ----------(P42T)   ----------(Q42F)   ------------------(IDIAxiom)    ------(NothingInEmpty)
;; (P 42) ≞ ⊤         (Q 42) ≞ ⊥         P → Q ≞ (∅, <1 0>)              42 ∉ ∅
;; -----------------------------------------------------------------------------------------(IDIInduction)
;;                                          P → Q ≞ $etv
! "===== Test inductive rule ====="
(: induction_prf (≞ (→ P Q) $etv))
(= induction_prf (IDIInduction P42m Q42m IDIAxiom NothingInEmpty))
!(induction_prf)
!(get-type induction_prf)

;; Test synthesizer
! "===== Test synthesizer on kb ====="
!(synthesize (: $proof (≘ P 42 $p42)) Z kb rb)
!(synthesize (: $proof (≘ Q 42 $q42)) Z kb rb)

! "===== Test synthesizer on axiom ====="
!(synthesize (: $proof (≞ (→ P Q) $etv)) Z kb rb)

! "===== Test synthesizer on induction rule ====="
!(synthesize (: $proof (≞ (→ P Q) $etv)) (S Z) kb rb)
