FROM foundationdb/foundationdb:7.1.37

# Add entrypoint file
COPY init_db.bash scripts/
COPY entrypoint.sh scripts/
RUN chmod u+x scripts/*.bash

RUN yum install -y nc

ENV FDB_INIT_DB_FILE_CONTENTS ""
ENV FDB_INIT_DB_SLEEP "1"

ENTRYPOINT [ "bash", "scripts/entrypoint.sh" ]
