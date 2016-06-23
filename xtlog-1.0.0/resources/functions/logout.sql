CREATE OR REPLACE FUNCTION public.logout() RETURNS integer AS $$
-- Copyright (c) 1999-2014 by OpenMFG LLC, d/b/a xTuple.
-- See www.xtuple.com/CPAL for the full text of the software license.
BEGIN
  IF (compareversion('9.2.0') <= 0)
  THEN
    PERFORM pg_advisory_unlock(datid::integer, pid)
     FROM pg_stat_activity
    WHERE(pid = pg_backend_pid());

    IF (packageIsEnabled('xtlog') = 't')

      THEN   
 
      UPDATE xtlog.xtlog SET xtlog_status='I', xtlog_backend_stop = now()
       WHERE 
        xtlog_backend_start = (SELECT backend_start FROM pg_stat_activity WHERE pid=pg_backend_pid())
       AND   
        xtlog_username=getEffectiveXtUser()
       AND
        xtlog_status = 'A'
       AND
        xtlog_backend_pid=pg_backend_pid();
 
    END IF;
    
  ELSE
    PERFORM pg_advisory_unlock(datid::integer, procpid)
       FROM pg_stat_activity
      WHERE(procpid = pg_backend_pid());

   IF (packageIsEnabled('xtlog') = 't')
      THEN   
 
   UPDATE xtlog.xtlog SET xtlog_status='I', xtlog_backend_stop = now()
    WHERE 
     xtlog_backend_start = (SELECT backend_start FROM pg_stat_activity WHERE procpid=pg_backend_pid())
    AND   
    xtlog_username=getEffectiveXtUser()
    AND
    xtlog_status = 'A'
    AND
     xtlog_backend_pid=pg_backend_pid();
  END IF;
END IF;
  RETURN 0;

END;

$$ LANGUAGE 'plpgsql';
