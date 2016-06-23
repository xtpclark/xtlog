select createPkgSchema('xtlog',
$$Client/Application Logging system add-on package for xTuple ERP.

This file is part of the xlog package for xTuple ERP: PostBooks Edition,
a free and open source Enterprise Resource Planning software suite,
Copyright (c) 1999-2016 by OpenMFG LLC, d/b/a xTuple.
It is licensed to you under the Common Public Attribution License
version 1.0, the full text of which (including xTuple-specific Exhibits)
is available at www.xtuple.com/CPAL.  By using this software, you agree
to be bound by its terms.$$);

ALTER SCHEMA xtlog OWNER TO admin;
