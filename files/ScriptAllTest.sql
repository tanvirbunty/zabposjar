DECLARE 
@zid int
SELECT @zid=zid from zbusiness
IF @zid<>'100070'
BEGIN
DELETE from opdoheader where xdate<EOMONTH(dateadd(m,-2,GETDATE())) and xpaytype='Card'
DELETE from opdodetail where xdornum IN(SELECT xdornum from opdoheader where xdate<EOMONTH(dateadd(m,-2,GETDATE())))
DELETE from opposmultiplecard where zutime<EOMONTH(dateadd(m,-2,GETDATE()))
END
