USE [voucher]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 9/09/2016 4:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ErroredVoucher] [varchar](50) NULL,
	[Date Scanned] [datetime] NULL,
	[Time Scanned] [datetime] NULL,
	[Site] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sites]    Script Date: 9/09/2016 4:52:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sites](
	[ID] [int] IDENTITY(5,1) NOT NULL,
	[Site] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WasteVouchers]    Script Date: 9/09/2016 4:52:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WasteVouchers](
	[ID] [int] IDENTITY(404998,1) NOT NULL,
	[Waste Voucher] [varchar](50) NULL,
	[Uses] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WasteVoucherUse]    Script Date: 9/09/2016 4:52:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WasteVoucherUse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Waste Voucher] [varchar](50) NULL,
	[Date Scanned] [datetime] NULL,
	[Time Scanned] [varchar](8) NULL,
	[Site] [varchar](50) NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[WasteVoucherUse] ADD  CONSTRAINT [DF_WasteVoucherUse_Date Scanned]  DEFAULT (getdate()) FOR [Date Scanned]
GO
ALTER TABLE [dbo].[WasteVoucherUse] ADD  CONSTRAINT [DF_WasteVoucherUse_Time Scanned]  DEFAULT (CONVERT([varchar],getdate(),(8))) FOR [Time Scanned]
GO
