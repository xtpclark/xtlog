# xtlog
Simple Client Access logging

Please note - this does not log all accesses to your database, only those from xTuple clients that make use of the login()/logout() functions.
If you want to log everything that touches your database cluster look at other native postgresql logging methods.

This package will produce logs in the format of:
<code>
-[ RECORD 1 ]-------+------------------------------
xtlog_id            | 1
xtlog_database      | demo
xtlog_username      | admin
xtlog_client_addr   | 192.168.0.33
xtlog_server_addr   | 192.168.0.10
xtlog_server_port   | 5432
xtlog_date          | 2016-06-23 17:40:56.470671+00
xtlog_status        | I
xtlog_application   | xTuple ERP (qt-client)
xtlog_backend_pid   | 4153
xtlog_backend_start | 2016-06-23 17:40:56.141028+00
xtlog_backend_stop  | 2016-06-23 17:45:55.442043+00
</code>

Logging the time the client connected (xtlog_backend_start) and the time it disconnected (xtlog_backend_stop). 
The stop time will not get updated unless the user closes the client. 
If the client crashes, or ungracefully kills the connection without invoking logout(), then it will not update the backend_stop time.



