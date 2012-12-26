select * from donator

select * from lookup_code where code_type='40'  and code1='10' order by describe
select * from lookup_code where  code_type='41' and code1 like '10%' order by describe




-- อำเภอ
declare @parentcode varchar(10)
set @parentcode='1033' -- 1033
select * from lookup_code 
where   
(
	(( @parentcode <> '' and code1 like @parentcode+'%' ) and code_type='42'  )
	or (code_type='42' and @parentcode='')
)




/*
	where 
		(

			(
				docdate between convert(varchar,@stdate,112) and convert(varchar,@enddate,112)	-- วันที่สร้างเอกสาร
				
				and (convert(varchar,@stdate,112)<>'' and convert(varchar,@enddate,112)<>'')
			)
			or (@stdate = '' and @enddate = '')
		)


*/
