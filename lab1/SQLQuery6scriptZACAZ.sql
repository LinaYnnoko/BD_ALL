USE [�������� �������]
GO

/****** Object:  Table [dbo].[���������]    Script Date: 18.02.2022 9:29:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[���������](
	[������������_�����] [nvarchar](20) NULL,
	[�����] [nvarchar](50) NULL,
	[��������� ����] [nvarchar](15) NULL,
 CONSTRAINT [IX_���������] UNIQUE NONCLUSTERED 
(
	[������������_�����] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


