-- Let’s count the number of times each user appears in the excite data set.

log = LOAD '$INPUT' AS (user, timestamp, query);
grpd = GROUP log BY query;
cntd = FOREACH grpd GENERATE group, COUNT(log) AS cnt;
ord = ORDER cntd BY cnt DESC;
OP = LIMIT ord 5;
STORE OP INTO '$OUTPUT';