MODULE_big = redis_fdw
OBJS = redis_fdw.o

EXTENSION = redis_fdw
DATA = $(wildcard redis_fdw--*.sql)

SHLIB_LINK += -lhiredis

PG_CONFIG = pg_config
PG_CFLAGS += -DWRITE_API -Werror
REGRESS = redis_fdw bulkdata

ifdef DEBUG
PG_CFLAGS += -DDO_DEBUG -O0 -g
endif

PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
