CLASS lhc_ZI_ISU_MoveIn DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZI_ISU_MOVEIN RESULT result.
ENDCLASS.

CLASS lhc_ZI_ISU_MoveIn IMPLEMENTATION.
  METHOD get_global_authorizations.
    IF requested_authorizations-%create EQ if_abap_behv=>mk-on.
      result-%create = if_abap_behv=>auth-allowed.
    ENDIF.

    IF requested_authorizations-%update EQ if_abap_behv=>mk-on.
      result-%update = if_abap_behv=>auth-allowed.
    ENDIF.

    IF requested_authorizations-%delete EQ if_abap_behv=>mk-on.
      result-%delete = if_abap_behv=>auth-allowed.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
