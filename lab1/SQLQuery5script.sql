USE [�������� �������]
GO

/****** Object:  Table [dbo].[������]    Script Date: 18.02.2022 9:26:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[������](
	[������������] [nvarchar](20) NULL,
	[����] [real] NULL,
	[����������] [int] NULL,
 CONSTRAINT [IX_������] UNIQUE NONCLUSTERED 
(
	[������������] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


