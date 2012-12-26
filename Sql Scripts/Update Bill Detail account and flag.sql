/*
select * from object_code
select * from found_code
select * from billdetail
select * from vwBillReci

*/

/*
select b.o_acccode,a.bdno,a.item 
from billdetail a 
left join object_code b on a.bdobject=b.o_code
where exists (  -- objective
	select aa.* from object_code aa where aa.o_flag='A' and aa.o_code=a.bdfound
)

select b.fd_acccode,a.bdno,a.item from billdetail a 
left join found_code b on a.bdfound=b.fd_code
where exists (  -- objective
	select aa.* from object_code aa where aa.o_flag='I' and aa.o_code=a.bdfound
) --and b.fd_status<>'C'



select a.* from billdetail a where exists (  -- foundation
	select aa.* from object_code aa where aa.o_flag='I' and aa.o_code=a.bdfound
)


*/

declare @acccode varchar(7)
declare @billno varchar(7)
declare @bankbookid varchar(7)
declare @item int

declare cr cursor for 
	select b.o_acccode,a.bdno,a.item,c.BankBookID 
	from billdetail a 
	left join object_code b on a.bdobject=b.o_code
	left join san$BANKBOOK  c on b.o_acccode=c.accid 

OPEN cr   
FETCH NEXT FROM cr INTO @acccode,@billno,@item,@bankbookid   

WHILE @@FETCH_STATUS = 0   
BEGIN   
	update billdetail set bdacccode=@acccode,bdflag='N',bdbankbook=@bankbookid where bdno=@billno and item=@item
	FETCH NEXT FROM cr INTO @acccode,@billno,@item,@bankbookid  
END   

CLOSE cr   
DEALLOCATE cr