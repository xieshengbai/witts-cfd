! This module is used to declare global arrays
!
  MODULE class_shared

  USE parameters, ONLY: DP
    
  IMPLICIT NONE

  TYPE :: CELL
    INTEGER:: CELL_INDEX                     ! INDEX OF THE CELL
    INTEGER:: CELL_EMID                      ! THE EMBEDDING LEVEL OF THE CELL
    INTEGER:: CELL_GHOST                     ! =1: GHOST CELL, =0: ACTIVE CELL
    INTEGER:: CELL_SPLIT                     ! =1: THIS CELL IS SPLITTED
    INTEGER:: CELL_ACTIVE                    ! =1: ACTIVE CELL, I.E., CELL_GHOST=0 & CELL_SPLIT=0
!---FOR GHOST CELL-------------------------------------------------------------------
    INTEGER:: CELL_PID                       ! RANK (PROCESSOR) ID
    INTEGER:: CELL_NEAR                      ! THE INDEX OF NEAREST NON-GHOST CELL
!---FOR EMBEDDED CELL----------------------------------------------------------------
    INTEGER:: CELL_PARENT                    ! INDEX OF THE PARENT CELL
    INTEGER:: CELL_CHILD(2,2,2)              ! INDEX OF THE CHILD CELL
!------------------------------------------------------------------------------------
    INTEGER:: CELL_NEI_X(2)                  ! THE INDEX OF NEIGHBORING CELLS
    INTEGER:: CELL_NEI_Y(2)
    INTEGER:: CELL_NEI_Z(2)

    INTEGER:: CELL_BOU_FLAG                  ! =0: INNER CELL, =1: BOUNDARY CELL
    INTEGER:: CELL_WALL                      ! =1: THE CELL ADJACENT TO WALL

    REAL(KIND=DP):: CELL_X,CELL_Y,CELL_Z     ! COORDINATES AT THE CELL CENTER

    REAL(KIND=DP):: CELL_DX,CELL_DY,CELL_DZ  ! SPACING OF THE CELL

    REAL(KIND=DP):: CELL_VAR(1:32)           !            1-3: VELOCITY COMPONENTS
                                             !              4: TEMPERATURE
                                             !              5: DYNAMIC PRESSURE
                                             !              6: EDDY VISCOSITY (NUR)
                                             !              7: SGS DISSIPATION    
                                             !              8: DENSITY (RHO)
                                             !              9: LEVEL-SET FUNCTION (PHI)
                                             !          10-12: FORCING TERMS
                                             !          13-18: STRAIN RATE TENSOR (Sij)
                                             !             19: MODULUS OF THE STRAIN RATE TENSOR (S)
                                             !          20-25: STRESS TENSOR
                                             !          26-28: HEAT FLUX 
                                             !          29-32: LASD RELATED VARIABLES (PLM,PMM,PQN,PNN)
    REAL(KIND=DP):: CELL_UF(3,2)             ! VELOCITY FLUX AT THE CELL FACES 
  END TYPE CELL

  TYPE(CELL),DIMENSION(:),ALLOCATABLE:: CELL_FV

 
  END MODULE class_shared
