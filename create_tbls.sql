USE [chatbot]
GO

/****** Object:  Table [dbo].[tbl_fiil]    Script Date: 5.10.2017 13:03:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_fiil](
	[fiil] [varchar](8000) NULL,
	[mastar] [varchar](8000) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


-------''--

USE [chatbot]
GO

/****** Object:  Table [dbo].[tbl_fiil_kip]    Script Date: 5.10.2017 13:04:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_fiil_kip](
	[icode] [int] IDENTITY(1,1) NOT NULL,
	[kip_tip] [varchar](15) NULL,
	[kip] [varchar](35) NULL,
	[kip_eki] [varchar](15) NULL,
	[kip_eki_v2] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


--------
USE [chatbot]
GO

/****** Object:  Table [dbo].[tbl_fiil_sahis]    Script Date: 5.10.2017 13:05:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[tbl_fiil_sahis](
	[icode] [int] IDENTITY(1,1) NOT NULL,
	[sahis_tip] [varchar](15) NULL,
	[sahis] [varchar](35) NULL,
	[sahis_eki] [varchar](15) NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[tbl_fiil_sahis] ADD [sahis_eki_v2] [varchar](50) NULL

GO

SET ANSI_PADDING OFF
GO

--------
USE [chatbot]
GO

/****** Object:  Table [dbo].[tbl_fiil_zaman]    Script Date: 5.10.2017 13:06:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_fiil_zaman](
	[icode] [int] IDENTITY(1,1) NOT NULL,
	[zaman_tip] [varchar](15) NULL,
	[zaman] [varchar](35) NULL,
	[zaman_eki] [varchar](15) NULL,
	[zaman_eki_v2] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

