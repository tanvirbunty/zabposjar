update opdef set xdate = GETDATE() where xacc = 'License Renew'

-- stop pos manullay from cloud
--update opdef set zactive = '1' where xacc = 'License Renew'
--update zbusiness set zactive = '1' where zid = '200020';  
