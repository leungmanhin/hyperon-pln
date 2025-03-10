# Program Synthesis Experiments

Contains a number of experiments to implement program synthesis, and
thus by extension reasoning, in MeTTa.

- `synthesize-via-type-checking.metta`: that experiment implements a
  synthesizer from scratch attempting to use the type checker to check
  the validity of combinations.  It fails because the type checker is
  static.

- `synthesize-via-superpose.metta`: that experiment is similar to
  `synthesize-via-type-checking.metta` but is simplified by using
  superposition.  It fails for the same reason.

- `unify-via-let.metta`: that experiment demonstrates that fully
  fledged syntactic unification can be achieved with the `let*`
  operator.

- `non-determinism.metta`: experiment with non-determinism.

- `synthesize-via-let.metta`: that experiment demonstrates that program
  synthesis can be achieved by combining unification, via `let*`, and
  non-determinism.

- `synthesize-via-let-test.metta`: contains a dozen+ tests of program
  synthesis via let.  It shows that forward chaining, backward
  chaining, type inference and more can be accomplished with this
  simple technique.

- `Synthesize.metta`: Fully fledged program synthesizer based on
  `synthesize-via-let.metta`.

- `SynthesizeTest.metta`: Tests for `Synthesize.metta`.


- `self-contained-synthesize.metta`: Self-contained version of
  `Synthesize.metta` and `SynthesizeTest.metta`.
