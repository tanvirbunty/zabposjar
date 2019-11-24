update opdef set xdate = GETDATE() where xacc = 'License Renew'

-- stop pos manullay from cloud
--update opdef set zactive = '1' where xacc = 'License Renew'
--update zbusiness set zactive = '1' where zid = '200020';  

--temporary remove minimum after 3 days
insert into opdef (xacc, zactive, zauserid, zid, ztime, zutime, zuuserid) values('Hold Bill', '1', 'zabadmin', 000000, GETDATE(), GETDATE(), 'zabadmin')
