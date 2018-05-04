SELECT xt.create_table('xtlog', 'xtlog');

ALTER TABLE xtlog.xtlog DISABLE TRIGGER ALL;

SELECT
 xt.add_column('xtlog','xtlog_id', 			'serial', 	'not null', 'xtlog'),
 xt.add_column('xtlog','xtlog_database', 		'text', 	'default current_database()', 'xtlog'),
 xt.add_column('xtlog','xtlog_username', 		'text', 	'', 'xtlog'),
 xt.add_column('xtlog','xtlog_client_addr', 	'inet', 	'default inet_client_addr()', 'xtlog'),
 xt.add_column('xtlog','xtlog_server_addr', 	'inet', 	'default inet_server_addr()', 'xtlog'),
 xt.add_column('xtlog','xtlog_server_port', 	'integer', 	'default inet_server_port()', 'xtlog'),
 xt.add_column('xtlog','xtlog_date', 			'timestamp with time zone', 'default now()', 'xtlog'),
 xt.add_column('xtlog','xtlog_status', 		'text', 	'', 			'xtlog'),
 xt.add_column('xtlog','xtlog_application', 	'text', 	'', 			'xtlog'),
 xt.add_column('xtlog','xtlog_backend_pid',   'integer', 'default pg_backend_pid()',	'xtlog'),
 xt.add_column('xtlog','xtlog_backend_start', 'timestamp with time zone','',			'xtlog'),
 xt.add_column('xtlog','xtlog_backend_stop',  'timestamp with time zone','',			'xtlog'),
 (TRUE);

comment on table xtlog.xtlog is 'Client/Application Audit Logging';
grant all on table xtlog.xtlog to admin;
grant all on table xtlog.xtlog to xtrole;
grant all on xtlog.xtlog_xtlog_id_seq to xtrole;
grant all on xtlog.xtlog_xtlog_id_seq to admin;

alter table xtlog.xtlog owner to admin;
alter table xtlog.xtlog_xtlog_id_seq owner to admin;
ALTER TABLE xtlog.xtlog ENABLE TRIGGER ALL;
