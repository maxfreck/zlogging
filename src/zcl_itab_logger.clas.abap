class zcl_itab_logger definition public inheriting from zcl_null_logger final create public.
  public section.
    types:
      begin of t_log,
        stamp   type timestampl,
        level   type zlogtype,
        message type string,
      end of t_log,
      t_log_t type standard table of t_log with key stamp level message.

    methods get_log returning value(ret) type t_log_t.

  protected section.
    data:
      it_log type t_log_t.

    methods msg redefinition.
endclass.

class zcl_itab_logger implementation.
  method get_log.
    ret = it_log.
  endmethod.

  method msg.
    get time stamp field data(l_now).
    append value #( stamp = l_now level = level message = msg ) to it_log.
    r_string = msg.
  endmethod.
endclass.