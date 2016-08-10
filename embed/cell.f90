! This module declares the sizes of dynamic global arrays.
! Also, it will deallocate those arrays at the end of simulation.
  MODULE CLASS_CELL

  IMPLICIT NONE


  TYPE :: CELL
    INTEGER:: CELL_INDEX                     ! INDEX OF THE CELL
    INTEGER:: CELL_EMID                      ! THE EMBEDDING LEVEL OF THE CELL
    INTEGER:: CELL_GHOST                     ! =1: GHOST CELL, =0: ACTIVE CELL
    INTEGER:: CELL_SPLIT                     ! =1: THIS CELL IS SPLITTED
    INTEGER:: CELL_NUM_VAR                   ! NUMBER OF VARIABLES
!---FOR GHOST CELL-------------------------------------------------------------------
    INTEGER:: CELL_MASTER_INDEX              ! THE INDEX OF THE MASTER CELL
    INTEGER:: CELL_PID                       ! RANK (PROCESSOR) ID
    INTEGER:: CELL_NEAR                      ! THE INDEX OF NEAREST NON-GHOST CELL 
!------------------------------------------------------------------------------------
    INTEGER:: CELL_NEI_X(2)           ! THE INDEX OF NEIGHBORING CELLS
    INTEGER:: CELL_NEI_Y(2)
    INTEGER:: CELL_NEI_Z(2)

    INTEGER:: CELL_BOU_FLAG                  ! =0: INNER CELL, =1: BOUNDARY CELL 

    REAL(KIND=DP):: CELL_X,CELL_Y,CELL_Z     ! COORDINATES AT THE CELL CENTER

    REAL(KIND=DP):: CELL_DX,CELL_DY,CELL_DZ  ! SPACING OF THE CELL

    REAL(KIND=DP):: CELL_VAR(CELL_NUM_VAR)   ! VARIABLES: 1-3: VELOCITY COMPONENTS
                                             !              4: TEMPERATURE
                                             !              5: DYNAMIC PRESSURE
                                             !              6: EDDY VISCOSITY
                                             !              7: MOLECULAR DYNAMIC VISCOSITY    
                                             !              8: DENSITY
                                             !              9: LEVEL-SET FUNCTION
  END TYPE CELL
     
   
  END MODULE