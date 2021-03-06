USE [foundation]
GO
/****** Object:  Table [dbo].[billdetail]    Script Date: 07/06/2012 14:24:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[billdetail](
	[bdno] [varchar](7) NULL,
	[bdobject] [varchar](4) NULL,
	[bdfound] [varchar](4) NULL,
	[bdamount] [numeric](14, 2) NULL,
	[bbankid] [varchar](6) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bill]    Script Date: 07/06/2012 14:24:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bill](
	[bid] [varchar](8) NULL,
	[bno] [varchar](7) NULL,
	[bperiod] [varchar](5) NULL,
	[bdate] [date] NULL,
	[btotal] [numeric](14, 2) NULL,
	[bpaytype] [varchar](2) NULL,
	[bbank] [varchar](2) NULL,
	[bbrance] [varchar](40) NULL,
	[brefno] [varchar](30) NULL,
	[brefdate] [date] NULL,
	[buserid] [varchar](5) NULL,
	[bfrom] [varchar](150) NULL,
	[bryid] [varchar](5) NULL,
	[bloc] [varchar](2) NULL,
	[bspiid] [varchar](5) NULL,
	[btime] [varchar](5) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
