USE [IgnasDB]
GO
/****** Object:  UserDefinedTableType [dbo].[CSVPersonTable]    Script Date: 2024-02-21 23:28:23 ******/
CREATE TYPE [dbo].[CSVPersonTable] AS TABLE(
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL
)
GO
/****** Object:  Table [dbo].[CSVImport]    Script Date: 2024-02-21 23:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSVImport](
	[Name] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ImportCSVFromDataTable]    Script Date: 2024-02-21 23:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,Ignas,Rodzianskis>
-- Create date: <Create Date,2024-02-21>
-- Description:	<Description,Database Export for CSVImporter>
-- =============================================
CREATE PROCEDURE [dbo].[ImportCSVFromDataTable] 
	-- Add the parameters for the stored procedure here
	@csvDataTable CSVPersonTable readonly
AS
BEGIN
	delete from [dbo].CSVImport;
	insert into [dbo].CSVImport select * from @csvDataTable;
END
GO
