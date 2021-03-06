      SUBROUTINE FVRS1E (A,K,N)
C
C     PURPOSE
C       TO SORT THE ELEMENTS OF A REAL*4 VECTOR, A, INTO ASCENDING
C       ORDER AND TO CONSTRUCT AN INTEGER*4 VECTOR, K, WHICH INDICATES
C       HOW THE ELEMENTS OF A HAVE BEEN REARRANGED.
C
C     USAGE
C       CALL FVRS1E(A,K,N)
C
C     DESCRIPTION OF PARAMETERS
C       A - REAL*4 VECTOR.
C              ON INPUT - A CONTAINS THE NUMBERS TO BE SORTED.
C              ON OUTPUT- A CONTAINS THE NUMBERS IN ASCENDING ORDER.
C       K - OUTPUT VECTOR CONTAINING INTERCHANGE INFORMATION, I.E.,
C           THE NUMBER IN A(K(I)) (OF THE INPUT A) HAS BEEN MOVED TO
C           A(I).
C       N - LENGTH OF A AND K.
C
C     SUBROUTINES AND FUNCTION SUBPROGRAMS REQUIRED
C       NONE
C
C     REMARKS
C       THE K-VECTOR CAN BE USED IN CONJUNCTION WITH SUBROUTINE FVRS1E
C       TO REARRANGE OTHER VECTORS IN THE SAME WAY THAT THE A-VECTOR
C       HAS BEEN REARRANGED.
C
C     METHOD
C       THIS ROUTINE IS A TRANSLATION OF THE ALGOL PROCEDURE,
C       'SHELLSORT', ALGORITHM 201, 'COLLECTED ALGORITHMS FROM CACM',
C       BY J. BOOTHROYD.
C
      DIMENSION A(1),K(1)
C
      DO 17 IKL =1,N
   17 K(IKL) = IKL
      I = 1
    1 I = I+I
      IF(I-N)1,2,7
    7 I = I/2
    2 CONTINUE
      M = 2*I-1
    5 CONTINUE
      M = M/2
      K1 = N-M
      DO 6 J=1,K1
      I = J
    3 IPM = I+M
      AIPM = A(IPM)
      IF(AIPM.GE.A(I)) GO TO 4
      W = A(I)
      KW = K(I)
      A(I) = AIPM
      K(I) = K(IPM)
      A(IPM) = W
      K(IPM) = KW
      I = I-M
      IF(I.GE.1) GO TO 3
    4 CONTINUE
    6 CONTINUE
      IF(M.GT.1) GO TO 5
      RETURN
      END
