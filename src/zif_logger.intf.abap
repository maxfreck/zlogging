interface zif_logger public.


  methods alert importing msg type string returning value(r_string) type string.
  methods critical importing msg type string returning value(r_string) type string.
  methods emergency importing msg type string returning value(r_string) type string.
  methods error importing msg type string returning value(r_string) type string.
  methods notice importing msg type string returning value(r_string) type string.
  methods warning importing msg type string returning value(r_string) type string.

  methods message importing level type zlogtype msg type string returning value(r_string) type string.
endinterface.
