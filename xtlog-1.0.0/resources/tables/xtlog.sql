	-- table definition

select xt.create_table('xtlog', 'xtlog');
select xt.add_column('xtlog','xtlog_id', 			'serial', 	'not null', 'xtlog');
select xt.add_column('xtlog','xtlog_database', 		'text', 	'default current_database()', 'xtlog');
select xt.add_column('xtlog','xtlog_username', 		'text', 	'', 'xtlog');
select xt.add_column('xtlog','xtlog_client_addr', 	'inet', 	'default inet_client_addr()', 'xtlog');
select xt.add_column('xtlog','xtlog_server_addr', 	'inet', 	'default inet_server_addr()', 'xtlog');
select xt.add_column('xtlog','xtlog_server_port', 	'integer', 	'default inet_server_port()', 'xtlog');
select xt.add_column('xtlog','xtlog_date', 			'timestamp with time zone', 'default now()', 'xtlog');
select xt.add_column('xtlog','xtlog_status', 		'text', 	'', 			'xtlog');
select xt.add_column('xtlog','xtlog_application', 	'text', 	'', 			'xtlog');
select xt.add_column('xtlog','xtlog_backend_pid',   'integer', 'default pg_backend_pid()',	'xtlog');
select xt.add_column('xtlog','xtlog_backend_start', 'timestamp with time zone','',			'xtlog');
select xt.add_column('xtlog','xtlog_backend_stop',  'timestamp with time zone','',			'xtlog');

comment on table xtlog.xtlog is 'Client/Application Audit Logging';
grant all on table xtlog.xtlog to admin;
grant all on table xtlog.xtlog to xtrole;
grant all on xtlog.xtlog_xtlog_id_seq to xtrole;
grant all on xtlog.xtlog_xtlog_id_seq to admin;

alter table xtlog.xtlog owner to admin;
alter table xtlog.xtlog_xtlog_id_seq owner to admin;
