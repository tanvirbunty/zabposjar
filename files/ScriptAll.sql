update opdef set xdate = GETDATE() where xacc = 'License Renew'

-- stop pos manullay from cloud
--update opdef set zactive = '1' where xacc = 'License Renew' and zid='200020'
--update zbusiness set zactive = '1' where zid = '200020';  

/** Temporary remove minimum after 3 days **/ 

