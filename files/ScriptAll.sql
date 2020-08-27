update opdef set xdate = GETDATE() where xacc = 'License Renew'

-- stop pos manullay from cloud
/**
-- update opdef set zactive = '1' where xacc = 'License Renew' and zid='200326';
-- update zbusiness set zactive = '1' where zid = '200326';

**/

/** Temporary remove minimum after 3 days **/ 
--ALTER TABLE opdodetail
--ALTER COLUMN xqtyord  numeric(20,3);

DECLARE 
@zid int,
@xshopno varchar(20) 
SELECT @zid=zid from zbusiness
select @xshopno=xshopno from xtrn where xtypetrn='Item Code' and zid=@zid
IF @zid<>'100070'
BEGIN
INSERT INTO xcodes(xcode,xtype,xshopno,zactive,zauserid,zid,ztime) values('Evaly Express','Delivery Service',@xshopno,'1','zabadmin',@zid,GETDATE());
INSERT INTO xcodes(xcode,xtype,xshopno,zactive,zauserid,zid,ztime) values('Pathao Food','Delivery Service',@xshopno,'1','zabadmin',@zid,GETDATE());
INSERT INTO xcodes(xcode,xtype,xshopno,zactive,zauserid,zid,ztime) values('Shohoz','Delivery Service',@xshopno,'1','zabadmin',@zid,GETDATE());
END

