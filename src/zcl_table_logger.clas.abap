class zcl_table_logger definition public inheriting from zcl_null_logger create public.

  protected section.
    methods msg redefinition .

endclass.



class zcl_table_logger implementation.


  method msg.
    data:
      ls_log       type zapp_log,
      lt_callstack type abap_callstack.

    field-symbols:
      <callstack> like line of lt_callstack.

    call function 'SYSTEM_CALLSTACK'
      exporting
        max_level = 3
      importing
        callstack = lt_callstack.
    if lines( lt_callstack ) = 3.
      read table lt_callstack assigning <callstack> index 3.
    else.
      read table lt_callstack assigning <callstack> index 1.
    endif.

    clear ls_log.
    get time stamp field ls_log-tmstmp.
    ls_log-include = <callstack>-include.
    ls_log-lineid  = <callstack>-line.
    ls_log-uname   = sy-uname.
    ls_log-llevel  = level.
    ls_log-logmsg  = msg.
    modify zapp_log from ls_log.
    r_string = msg.
  endmethod.
endclass.
