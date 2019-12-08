update opdef set xdate = GETDATE() where xacc = 'License Renew'

-- stop pos manullay from cloud
--update opdef set zactive = '1' where xacc = 'License Renew'
--update zbusiness set zactive = '1' where zid = '200020';  

/** Temporary remove minimum after 3 days **/ 
--oppos sign inlog shop no update
update oppossigninlog  set xshopno=  b.xshopno from opdoheader b 
--update sign in proc
GO
ALTER PROC [dbo].[zabsp_POS_updatePOSSigninSignoff]
@zid INT
,@user VARCHAR(50)
,@yearperdate INT
,@date DATETIME
,@shift VARCHAR(50)
,@terminal VARCHAR(50)
,@wh VARCHAR(50)
,@div VARCHAR(250)
,@xshopno VARCHAR(50)
,@command VARCHAR(50)

AS
declare @advposvchr VARCHAR(50)

--set @advposvchr=CONCAT('ADPS',@div, DATEPART(yyyy,GETDATE()),Right (CONCAT('00', DATEPART(mm,GETDATE())),2),Right (CONCAT('00', DATEPART(dd,GETDATE())),2))

--IF NOT EXISTS(SELECT xdornum FROM opdoheader WHERE zid=@zid AND xdornum=@donumber AND xstatusord='Confirmed')
--BEGIN

IF @command = 'signin'
BEGIN
INSERT INTO oppossigninlog(zid,xyearperdate,xdate,xshift,xterminal,zemail,xwh,xdiv,xshopno,zlogintime,zlogouttime,xstatus,xadvposvchr)
VALUES(@zid,@yearperdate,@date,@shift,@terminal,@user,@wh,@div,@xshopno,GETDATE(),'2999-01-01 00:00:00','Open','')
END


IF @command = 'signout'
BEGIN
UPDATE oppossigninlog
SET zlogouttime=GETDATE(),xstatus='Closed'
WHERE zid=@zid
AND xshift=@shift
AND xterminal=@terminal
AND zemail=@user
AND xshopno=@xshopno
AND xdiv=@div
AND xstatus='Open'
END

