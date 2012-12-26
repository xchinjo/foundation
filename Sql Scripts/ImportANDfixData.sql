/*
select * from bill

update bill set bstatus='A'
select count(*) from bill 
select count(*) from billdetail

select COUNT(*) from pgdb.dbo.cancel

delete from bill
delete from billdetail
delete from support
delete from royal
delete from donator

delete from MTTCDE where MTTGRP='PRENAME'

select * from support
select * from royal

brefdate
0040256	1708-12-15
0045268	1709-12-15
0068968	1679-04-22

*/


-- fix bill table -- 
use fddb
update pgdb.dbo.bill set brefdate=null where bno in ('0040256','0045268','0068968')
insert into bill(bid,bno,bperiod,bdate,btotal,bpaytype,bbank,bbrance,brefno,brefdate,buserid,bfrom,bryid,bloc,bspiid,bstatus)
select bid,bno,bperiod,bdate,btotal,bpaytype,bbank,bbrance,brefno,brefdate,buserid,bfrom,bryid,bloc,bspiid,'A' as bstatus from pgdb.dbo.bill

-- fix bill cancel table -- 
insert into bill(bid,bno,bperiod,bdate,btotal,bpaytype,bbank,bbrance,brefno,brefdate,buserid,bfrom,bryid,bloc,bspiid,bstatus)
select bid,bno,bperiod,bdate,btotal,bpaytype,bbank,bbrance,brefno,brefdate,buserid,bfrom,bryid,bloc,bspiid,'I' as bstatus from pgdb.dbo.cancel



-- import billdetail
declare @abdno  as varchar(7)
declare @bdno  as varchar(7)
declare @bdobject as varchar(4)
declare @bdfound as varchar(4)
declare @bdamount as numeric(14,2)
declare @bbankid as varchar(7)

declare @irow as int

-- import active bill details

declare c1 cursor for
	select bdno from pgdb.dbo.billdetail
open c1 	
fetch  next from c1 into @abdno
while @@fetch_status=0 
begin
	--// cursor 2
		set @irow=1
		declare c2 cursor for
			select bdno,bdobject,bdfound,bdamount,bbankid from pgdb.dbo.billdetail where bdno=@abdno 
		open c2 	
		fetch  next from c2 into @bdno,@bdobject,@bdfound,@bdamount,@bbankid
		while @@fetch_status=0 
		begin
			print @abdno
			insert into billdetail(bdno,item,bdobject,bdfound,bdamount,bdbankbook) 
			values(@bdno,@irow,@bdobject,@bdfound,@bdamount,@bbankid)	
			set @irow=@irow+1
			fetch  next from c2 into @bdno,@bdobject,@bdfound,@bdamount,@bbankid
		end

		close c2
		deallocate c2	
	--//
	fetch  next from c1 into @abdno
end

close c1
deallocate c1



-- import cancel bill detail
declare c1 cursor for
	select bdno from pgdb.dbo.cdetail
open c1 	
fetch  next from c1 into @abdno
while @@fetch_status=0 
begin
	--// cursor 2
		set @irow=1
		declare c2 cursor for
			select bdno,bdobject,bdfound,bdamount from pgdb.dbo.cdetail where bdno=@abdno 
		open c2 	
		fetch  next from c2 into @bdno,@bdobject,@bdfound,@bdamount
		while @@fetch_status=0 
		begin
			print @abdno
			insert into billdetail(bdno,item,bdobject,bdfound,bdamount) 
			values(@bdno,@irow,@bdobject,@bdfound,@bdamount)	
			set @irow=@irow+1
			fetch  next from c2 into @bdno,@bdobject,@bdfound,@bdamount
		end

		close c2
		deallocate c2	
	--//
	fetch  next from c1 into @abdno
end

close c1
deallocate c1


--  import support
insert into support(
[spiid],[spid],[spamass],[spdate],[spcode],[spappdate],[sptotal]
      ,[spowner],[spid2],[spininame],[spname],[spfname],[spbirth],[spage],[spdate1]
      ,[spdate2],[spdate3],[spdate4],[spremark],[spend]
)
select * from pgdb.dbo.support


-- import royal
insert into royal(
		[ryid],[id],[ryamass],[ryrdate],[ryrcode],[ryappdate],[ryappdoc],[ryappdout],[ryansdate]
      ,[ryansdoc],[ryapcode],[ryapyear],[rydate1],[rydate2],[rydate3],[rydate4],[ryremark]
      ,[rypass],[rytotal],[rystatus],[rylevel],[ryservice],[ryininame]
      ,[ryname],[ryfname],[ryend]
      ,[ryansdate2],[ryansdoc2]
)
select * from pgdb.dbo.royal


-- import prename
if object_id( 'tempdb..#temp0001' ) is not  null drop table #temp0001
select identity(int) as item,ltrim(rtrim(prename)) as  prename 
into #temp0001	
from pgdb.dbo.foundation 
group by  prename  

	--// cursor 2
		declare @item as int
		declare @prename varchar(150)
	
		
		declare c2 cursor for
			select item,prename from #temp0001	
			--select * from MTTCDE where MTTGRP='PRENAME'
			--delete from MTTCDE where MTTGRP='PRENAME'
		open c2 	
		fetch  next from c2 into @item,@prename
		while @@fetch_status=0 
		begin
			--print @abdno
			insert into MTTCDE(MTTACT,MTTSTS,MTTABR,MTTGRP,MTTCDE,MTTDES) 
			values('A','A','PRENAME'+cast(@item as varchar(3)),'PRENAME',@item,@prename)	
			fetch  next from c2 into @item,@prename
		end

		close c2
		deallocate c2	
	--//

-- import donators
insert into   donator (
  	  [do_precde] 
	  ,[do_id]
      ,[do_prename]
      ,[do_name]
      ,[do_lname]
      --,[do_dof]
      ,[do_phone]
      ,[do_mobile]
      ,[do_gtotal]
      ,[do_contact]
      ,[do_pid]
      ,[do_email]
      ,[do_addr1]
      ,[do_mu1]
      ,[do_soi1]
      ,[do_street1]
      ,[do_tambon1]
      ,[do_amphor1]
      ,[do_province1]
      ,[do_zipcode1]
      ,[do_remark1]
      ,[do_addr2]
      ,[do_mu2]
      ,[do_soi2]
      ,[do_street2]
      ,[do_tambon2]
      ,[do_amphor2]
      ,[do_province2]
      ,[do_zipcode2]
      ,[do_remark2]
      ,[do_entrydate]
      ,[do_occupat]
)
select b.MTTCDE,[id],[prename],[name],[fname]
	  --,[birth]
	  ,[telephone],[mobile],[total],[contact]
      ,[pid],[email],[addr],[mu],[soi],[street],[subdist],[district],[province],[zip]
      ,[remark],[addr2],[mu2],[soi2],[street2],[subdist2],[district2],[province2]
      ,[zip2],[remark2],[date_en],[occupat]
from pgdb.dbo.foundation a
left join  MTTCDE b on ltrim(rtrim(a.prename))=ltrim(rtrim(b.MTTDES)) and b.MTTGRP='PRENAME'


