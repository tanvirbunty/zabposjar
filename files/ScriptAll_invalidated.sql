update opdef set xdate = GETDATE() where xacc = 'License Renew'

--update opdef set zactive = '1' where xacc = 'License Renew'
update zbusiness set zactive = '0' where zid = '200020';  
