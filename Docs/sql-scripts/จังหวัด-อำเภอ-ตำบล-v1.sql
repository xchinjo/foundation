declare @provincecode varchar(12)
declare @amphurcode varchar(12)
declare @tamboncode varchar(12)
declare @codetype varchar(2)
declare @searchcode varchar(50)
declare @searchtext varchar(255)

set @searchcode='3'
set @searchtext=''


set @provincecode='' /* -- 34		=40 */
set @amphurcode='' /* -- 3415		=41   3401,3402 */
set @tamboncode='341521' /*-- 341521		=42 */
set @codetype='41'


select * from (
select * from lookup_code 
where   
(
	/* provice */
	(
		(( @provincecode <> '' and code1 =@provincecode ) and code_type='40'  )		
	) or 
	(
		(( @amphurcode <> '' and code1 like left(@amphurcode,2)+'%' ) and code_type='40'  )
		or (code_type='40' and @amphurcode='' and @tamboncode='' and @provincecode='') 
	) or
	(
		(( @tamboncode <> '' and code1 like left(@tamboncode,2)+'%' ) and code_type='40'  )
		or (code_type='40' and @amphurcode='' and @tamboncode='' and @provincecode='' ) 
	) 
	
	
	
) and used_flag<>'C'
union select * from lookup_code where
(
	/* amphur */
	
	(
		(( @amphurcode <> '' and code1 =@amphurcode ) and code_type='41'  )		
	) or 
	(
		(( @provincecode <> '' and @amphurcode='' and code1 like @provincecode+'%' ) and code_type='41'  )
		or (code_type='41' and @amphurcode='' and @tamboncode='' and @provincecode='') 
	) or
	(
		(( @tamboncode <> '' and code1 like left(@tamboncode,4)+'%' ) and code_type='41'  )
		or (code_type='41' and @amphurcode='' and @tamboncode='' and @provincecode='' ) 
	) 

)and used_flag<>'C'
union select * from lookup_code where
(
	/* tambon */
	
	(
		(( @tamboncode <> '' and code1 =@tamboncode ) and code_type='42'  )		
	) or 
	(
		(( @provincecode <> '' and @amphurcode='' and @tamboncode='' and  code1 like @provincecode+'%' ) and code_type='42'  )
		or (code_type='42' and @amphurcode='' and @tamboncode='' and @provincecode='') 
	) or
	(
		(( @amphurcode <> '' and @tamboncode='' and code1 like @amphurcode+'%' ) and code_type='42'  )
		or (code_type='42' and @amphurcode='' and @tamboncode='' and @provincecode='' ) 
	) 

)and used_flag<>'C'
) xx where 
xx.code_type=@codetype
      and (
            (@searchcode='') or (  code1 like @searchcode+'%')                      
          )
      and (
            (@searchtext='') or (  describe like @searchtext+'%')                      
          )          