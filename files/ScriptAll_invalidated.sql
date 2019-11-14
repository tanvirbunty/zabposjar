  update zbusiness set zactive = '0' where zid = '200020';
  update zbusiness set xzip = '0' where zid = '200020';

  USE [ZABPOSDB]
GO
/****** Object:  StoredProcedure [dbo].[Func_getTrn]    Script Date: 9/26/2019 12:13:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER  PROC [dbo].[Func_getTrn]
	@zid INT,
	@typetrn varchar(50),
	@trn varchar(50), 
	@LenV int,
	@strVar varchar(50)  OUTPUT
AS
DECLARE @count int,
	@numVar varchar(50),
	@paddval char(1),
	@lastnum int,
	@inc int,
	@Len int

SET @count=1
SET @paddval = '0'
SET @lastnum = 0;

SELECT @lastnum = xnum from xtrn where zid=@zid AND xtypetrn=@typetrn and xtrn=@trn

IF @lastnum=0 AND @typetrn='Promo Code'
BEGIN
insert into xtrn(xtrn,xtypetrn,zid,zactive,xnum,ztime) values('PR1--','Promo Code',@zid,'1',1500,CURRENT_TIMESTAMP)
SELECT @lastnum = xnum from xtrn where zid=@zid AND xtypetrn=@typetrn and xtrn=@trn
END
IF @lastnum=0 AND @typetrn='MR Code'
BEGIN
insert into xtrn(xtrn,xtypetrn,zid,zactive,xnum,ztime) values('MR1--','MR Code',@zid,'1',1500,CURRENT_TIMESTAMP)
SELECT @lastnum = xnum from xtrn where zid=@zid AND xtypetrn=@typetrn and xtrn=@trn
END
IF @lastnum=0 AND @typetrn='Customer Code'
BEGIN
insert into xtrn(xtrn,xtypetrn,zid,zactive,xnum,ztime) values('CUS1-','Customer Code',@zid,'1',1500,CURRENT_TIMESTAMP)
SELECT @lastnum = xnum from xtrn where zid=@zid AND xtypetrn=@typetrn and xtrn=@trn
END
SELECT @inc = xinc from xtrn where zid=@zid AND xtypetrn=@typetrn and xtrn=@trn

SET @numVar = @lastnum+1

/*updating xtrn*/
UPDATE xtrn set xnum=@numVar where zid=@zid AND xtypetrn=@typetrn and xtrn=@trn
--UPDATE [10.0.0.21].zabdb.dbo.xtrn set xnum=@numVar where xtypetrn=@typetrn and xtrn=@trn

SET @Len=@LenV - LEN(@numVar)
WHILE @count<=@Len
  BEGIN 
    SET @numVar = @paddval + @numVar
    SET @count=@count + 1
  END 
SET @strVar=@numVar



RETURN