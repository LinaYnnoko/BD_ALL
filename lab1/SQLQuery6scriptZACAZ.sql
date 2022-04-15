USE [Ездакова ПРОДАЖИ]
GO

/****** Object:  Table [dbo].[ЗАКАЗЧИКИ]    Script Date: 18.02.2022 9:29:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ЗАКАЗЧИКИ](
	[Наименование_фирмы] [nvarchar](20) NULL,
	[Адрес] [nvarchar](50) NULL,
	[Расчетный счет] [nvarchar](15) NULL,
 CONSTRAINT [IX_ЗАКАЗЧИКИ] UNIQUE NONCLUSTERED 
(
	[Наименование_фирмы] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


