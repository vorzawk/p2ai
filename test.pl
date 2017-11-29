marks(db, 60).
marks(ai, 80).

agr_marks(C1,C2,M) :- marks(C1,M1), marks(C2, M2), M is M1 + M2.

