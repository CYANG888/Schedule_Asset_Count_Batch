CLASS yab_cl_aa_asset_master_implmnt DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES yab_if_aa_asset_master .
protected section.

  types:
    BEGIN OF ty_custom1,
             value TYPE yab_aa_zzcust1,
           END OF ty_custom1 .
  types:
    BEGIN OF ty_custom2,
             value TYPE yab_aa_zzcust2,
           END OF ty_custom2 .

  data:
    gt_custom1 TYPE STANDARD TABLE OF ty_custom1 .
  data:
    gt_custom2 TYPE STANDARD TABLE OF ty_custom2 .

  methods SET_DROPBOX
    importing
      !FIELD_NAME type VRM_ID .
private section.
ENDCLASS.



CLASS YAB_CL_AA_ASSET_MASTER_IMPLMNT IMPLEMENTATION.


  METHOD set_dropbox.

    DATA : dropbox_list TYPE vrm_values.

    CLEAR dropbox_list.

    "Custom value1 dropdown
    IF field_name = 'ANLU-ZZCUST1'.

      SELECT value
        FROM yab_aa_custom1
        INTO CORRESPONDING FIELDS OF TABLE gt_custom1
        WHERE value <> ''.
      IF sy-subrc = 0.
        dropbox_list = gt_custom1.

        CALL FUNCTION 'VRM_SET_VALUES'
          EXPORTING
            id     = field_name
            values = dropbox_list.
      ENDIF.
    ENDIF.


    "Custom value2 dropdown
    IF field_name = 'ANLU-ZZCUST2'.

      SELECT value
        FROM yab_aa_custom2
        INTO CORRESPONDING FIELDS OF TABLE gt_custom2
        WHERE value <> ''.
      IF sy-subrc = 0.
        dropbox_list = gt_custom2.

        CALL FUNCTION 'VRM_SET_VALUES'
          EXPORTING
            id     = field_name
            values = dropbox_list.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD yab_if_aa_asset_master~get_data.

    chg_anlu = import_anlu.

  ENDMETHOD.


  METHOD yab_if_aa_asset_master~set_display_edit.

    "Display mode
    IF current_tcode = 'AS03' .
      LOOP AT SCREEN.
        IF screen-group1 = 'YAS'.
          screen-input = 0 .
          MODIFY SCREEN.
        ENDIF.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.


  METHOD yab_if_aa_asset_master~set_screen.

    "Display
    LOOP AT SCREEN.
      screen-invisible = 0.
      screen-input = 1.
      screen-active = 1.
      MODIFY SCREEN.
    ENDLOOP.

    "Set Dropbox 1
    me->set_dropbox( field_name = 'ANLU-ZZCUST1' ).

    "Set Dropbox 2
    me->set_dropbox( field_name = 'ANLU-ZZCUST2' ).


  ENDMETHOD.


  METHOD yab_if_aa_asset_master~transfer_data.

    "Pass back to standard SAP program to process and save in ANLU (E_ANLU)
    chg_anlu-zztag   = import_anlu-zztag.
    chg_anlu-zzcust1 = import_anlu-zzcust1.
    chg_anlu-zzcust2 = import_anlu-zzcust2.
    chg_anlu-zzcust3 = import_anlu-zzcust3.
    chg_anlu-zzcust4 = import_anlu-zzcust4.
    chg_anlu-zzcust5 = import_anlu-zzcust5.

  ENDMETHOD.
ENDCLASS.
