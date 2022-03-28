FROM foundationdb/foundationdb:6.2.30

# Add entrypoint file
COPY init_db.bash scripts/
COPY entrypoint.sh scripts/
RUN chmod u+x scripts/*.bash

RUN apt-get update && \
  apt-get install --yes --no-install-recommends netcat

ENV FDB_INIT_DB_FILE_CONTENTS ""
ENV FDB_INIT_DB_SLEEP "1"

ENTRYPOINT [ "bash", "scripts/entrypoint.sh" ]
