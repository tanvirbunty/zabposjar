update opdef set xdate = GETDATE() where xacc = 'License Renew'

-- stop pos manullay from cloud
/**
update opdef set zactive = '1' where xacc = 'License Renew' and zid='200326';
update zbusiness set zactive = '1' where zid = '200326';
**/

/** Temporary remove minimum after 3 days **/ 
ALTER TABLE opdodetail
ALTER COLUMN xqtyord  numeric(20,3);

--DECLARE 
--@zid int
--SELECT @zid=zid from zbusiness
--IF @zid<>'100070'
--BEGIN
--DELETE from opposmultiplecard where zutime<EOMONTH(dateadd(m,-2,GETDATE()))
--DELETE from opdodetail where xdornum IN(SELECT xdornum from opdoheader where xdate<EOMONTH(dateadd(m,-2,GETDATE())))
--DELETE from opdoheader where xdate<EOMONTH(dateadd(m,-2,GETDATE())) 
--END

