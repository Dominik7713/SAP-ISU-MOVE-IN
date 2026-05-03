CLASS zisu_movein_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zisu_movein_fill IMPLEMENTATION.
    METHOD if_oo_adt_classrun~main.

        DATA: equipment_data TYPE TABLE OF zisu_equip_tmd.
            equipment_data = VALUE #(
            ( equip_id = '0000000001' serial_num = '100000000000000001' meter_reading = '0' UOM = 'KWH' city = 'TBD' street = 'TBD'  )
            ( equip_id = '0000000002' serial_num = '100000000000000002' meter_reading = '300' UOM = 'KWH' city = 'Veresegyház' street = 'Kodály Zoltán utca 1' )
            ( equip_id = '0000000003' serial_num = '100000000000000003' meter_reading = '0' UOM = 'KWH' city = 'TBD' street = 'TBD'  )
            ).

        MODIFY zisu_equip_tmd FROM TABLE @equipment_data.


         DATA: contract_data TYPE TABLE OF zisu_cont_bmd.
            contract_data = VALUE #(
            ( contract_id = '1' customer_name = 'Dominik Balogh' status = 'A' equip_id = '0000000002' move_in_date = '20260101' changed_at = '20260506')
            ).

        MODIFY zisu_cont_bmd FROM TABLE @contract_data.

        IF sy-subrc <> 0.
            out->write( 'Error' ).
        ELSE.
            out->write( |Count: { sy-dbcnt } | ).
        ENDIF.

    ENDMETHOD.
ENDCLASS.
