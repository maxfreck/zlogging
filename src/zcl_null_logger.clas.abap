class zcl_null_logger definition public abstract create public.
  public section.
    interfaces zif_logger.

  protected section.
    methods msg importing level type zlogtype msg type string returning value(r_string) type string.

endclass.



class zcl_null_logger implementation.


  method msg.
    r_string = msg.
  endmethod.


  method zif_logger~alert.
    r_string = msg( level = 5 msg = msg ).
  endmethod.


  method zif_logger~critical.
    r_string = msg( level = 4 msg = msg ).
  endmethod.


  method zif_logger~emergency.
    r_string = msg( level = 6 msg = msg ).
  endmethod.


  method zif_logger~error.
    r_string = msg( level = 3 msg = msg ).
  endmethod.


  method zif_logger~message.
    r_string = msg( level = level msg = msg ).
  endmethod.


  method zif_logger~notice.
    r_string = msg( level = 1 msg = msg ).
  endmethod.


  method zif_logger~warning.
    r_string = msg( level = 2 msg = msg ).
  endmethod.
endclass.
