USE [Ездакова ПРОДАЖИ]
GO

/****** Object:  Table [dbo].[ТОВАРЫ]    Script Date: 18.02.2022 9:26:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ТОВАРЫ](
	[Наименование] [nvarchar](20) NULL,
	[Цена] [real] NULL,
	[Количество] [int] NULL,
 CONSTRAINT [IX_ТОВАРЫ] UNIQUE NONCLUSTERED 
(
	[Наименование] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


