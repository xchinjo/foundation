/*
	============ patch uit patype tables database ===========
	-- move tables patype_code == to ==> paytype
*/
DROP TABLE [dbo].[paytype]
GO
DROP TABLE [dbo].[paytype_code]
GO
/****** Object:  Table [dbo].[paytype]    Script Date: 12/06/2012 16:34:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[paytype](
	[pt_code] [varchar](2) NOT NULL,
	[pt_title] [varchar](60) NULL,
	[pt_abbr] [varchar](20) NULL,
	[pt_status] [varchar](1) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'11', N'เช็คธนาคารไทยพาณิชย์ จำกัด', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'12', N'เช็คธนาคารนครหลวงไทย', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'13', N'เช็คธนาคารทหารไทย', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'14', N'เช็คธนาคารกรุงเทพ', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'15', N'เช็คธนาคารกสิกรไทย', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'16', N'เช็คธนาคารกรุงไทย', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'18', N'เช็คธนาคารศรีนคร', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'19', N'เช็คธนาคารกรุงศรีอยุธยา', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'20', N'เช็คธนาคารเอเชีย', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'21', N'เช็คธนาคารชาเตอร์นครธน', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'22', N'เงินสด', N'เงินสด', N' ')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'23', N'เงินโอนเข้าธนาคารไทยพาณิชย์จำกัด สาขาโรงพยาบาลราชวิถี', N'เงินโอน', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'24', N'ธนาณัติ', N'ธนาณัติ', N' ')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'25', N'ตั๋วแลกเงิน', N'ตั๋วแลกเงิน', N' ')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'26', N'เช็คธนาคารออมสิน', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'30', N'เช็คธนาคารซิตี้แบงก์', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'31', N'เช็คธนาคารยูโอบี รัตนสิน', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'32', N'เช็คธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้งคอร์ปอเรชั่น จำกัด', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'33', N'เช็คธนาคารอาคารสงเคราะห์', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'34', N'เช็ค Northern Turst Bank', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'35', N'Bank of America, N.A.', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'36', N'เช็คธนาคารไทยธนาคาร จำกัด (มหาชน)', N'เช็ค', N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'37', N'เช็คธนาคารแห่งโตเกียว-มิตซูบิชิ จำกัด', NULL, N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'38', N'เช็คธนาคารสแตนดาร์ดชาร์เตอร์ด', NULL, N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'39', N'เช็คธนาคาร คาลิยง', NULL, N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'40', N'เช็ค Mizuho', NULL, N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'41', N'เช็คธนาคารดอยซ์แบงก์', NULL, N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'42', N'ตั๋วแลกเงิน ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)', NULL, N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'43', N'เงินโอนธนาคารกรุงไทย สาขาถนนศรีอยุธยา', NULL, N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'44', N'เงินโอน ธนาคารกรุงเทพ จำกัด(มหาชน) สาขาอาคารยาคูลท์', NULL, N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'45', N'เงินโอน ธนาคารไทยธนาคาร จำกัด (มหาชน)', NULL, N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'46', N'เงินโอน ธนาคารออมสิน สำนักพหลโยธิน', NULL, N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'47', N'เช็คธนาคารธนชาต', NULL, N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'48', N'เงินโอนธนาคารกสิกรไทย สาขาสนามเป้า', NULL, N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'49', N'ตั๋วแลกเงิน ธนาคารกสิกรไทย', NULL, N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'50', N'เงินโอน', NULL, N' ')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'51', N'เงินโอนธนาคารทหารไทย (จำกัด) สาขา รพ.พระมงกุฎ', NULL, N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'52', N'เช็คธนาคาร เครดิต อะกริกอล', NULL, N'C')
INSERT [dbo].[paytype] ([pt_code], [pt_title], [pt_abbr], [pt_status]) VALUES (N'28', N'เช็ค', N'เช็ค', N'')

drop view vwBillReci
go

CREATE VIEW vwBillReci
AS
SELECT 
	M.BNO,M.BDATE,M.BTOTAL,M.BPAYTYPE,M.BBANK,M.BBRANCE,M.BREFNO,M.BREFDATE,M.BFROM,D.*,D.BDFLAG ACC_STATUS
	,P.*
FROM dbo.bill M 
LEFT OUTER JOIN dbo.billdetail D  ON(M.bno = D.bdno)
LEFT OUTER JOIN dbo.paytype P ON(M.bpaytype = P.pt_code)
WHERE ISNULL(M.btotal,0.0) <> 0.0
GO