USE [master]
GO
/****** Object:  Database [pos]    Script Date: 05/09/2013 13:29:52 ******/
CREATE DATABASE [pos] ON  PRIMARY 
( NAME = N'pos', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\pos.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'pos_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\pos_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [pos] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pos] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [pos] SET ANSI_NULLS OFF
GO
ALTER DATABASE [pos] SET ANSI_PADDING OFF
GO
ALTER DATABASE [pos] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [pos] SET ARITHABORT OFF
GO
ALTER DATABASE [pos] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [pos] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [pos] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [pos] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [pos] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [pos] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [pos] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [pos] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [pos] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [pos] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [pos] SET  DISABLE_BROKER
GO
ALTER DATABASE [pos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [pos] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [pos] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [pos] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [pos] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [pos] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [pos] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [pos] SET  READ_WRITE
GO
ALTER DATABASE [pos] SET RECOVERY SIMPLE
GO
ALTER DATABASE [pos] SET  MULTI_USER
GO
ALTER DATABASE [pos] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [pos] SET DB_CHAINING OFF
GO
USE [pos]
GO
/****** Object:  Table [dbo].[test]    Script Date: 05/09/2013 13:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[test](
	[deptID] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NULL,
	[bgColor] [nvarchar](20) NULL,
	[textColor] [nvarchar](20) NULL,
	[costCenter] [nvarchar](10) NULL,
	[saleAcct] [nvarchar](20) NULL,
	[purchaseAcct] [nvarchar](20) NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
	[image] [varchar](100) NULL,
	[deptName] [varchar](100) NULL,
 CONSTRAINT [PK_test] PRIMARY KEY CLUSTERED 
(
	[deptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[brand]    Script Date: 05/09/2013 13:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[brandID] [int] IDENTITY(1,1) NOT NULL,
	[brandName] [nvarchar](100) NULL,
	[description] [nvarchar](50) NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_brand] PRIMARY KEY CLUSTERED 
(
	[brandID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[department]    Script Date: 05/09/2013 13:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[department](
	[deptID] [int] IDENTITY(1,1) NOT NULL,
	[deptName] [varchar](100) NULL,
	[description] [nvarchar](50) NULL,
	[image] [varchar](100) NULL,
	[bgColor] [nvarchar](20) NULL,
	[textColor] [nvarchar](20) NULL,
	[costCenter] [nvarchar](10) NULL,
	[saleAcct] [nvarchar](20) NULL,
	[purchaseAcct] [nvarchar](20) NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED 
(
	[deptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[comment]    Script Date: 05/09/2013 13:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comment](
	[commentID] [int] NOT NULL,
	[reference] [nvarchar](25) NULL,
	[description] [nvarchar](50) NULL,
	[image] [varchar](100) NULL,
	[bgColor] [nvarchar](20) NULL,
	[textColor] [nvarchar](20) NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_comment] PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[modifier_header]    Script Date: 05/09/2013 13:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modifier_header](
	[modifierID] [int] NOT NULL,
	[reference] [nvarchar](25) NULL,
	[description] [nvarchar](50) NULL,
	[divisible] [nchar](1) NULL,
	[comment] [nvarchar](200) NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_modifier_header] PRIMARY KEY CLUSTERED 
(
	[modifierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modifier_detail]    Script Date: 05/09/2013 13:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modifier_detail](
	[modifierID] [int] NOT NULL,
	[itemID] [int] NULL,
	[isItem] [nchar](1) NULL,
	[portion] [float] NULL,
	[priceChange] [float] NULL,
	[position] [int] NULL,
	[formatID] [int] NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_modifier_detail] PRIMARY KEY CLUSTERED 
(
	[modifierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[format]    Script Date: 05/09/2013 13:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[format](
	[formatID] [int] NOT NULL,
	[reference] [nvarchar](25) NULL,
	[description] [nvarchar](50) NULL,
	[image] [varchar](100) NULL,
	[bgColor] [nvarchar](20) NULL,
	[textColor] [nvarchar](20) NULL,
	[combination] [nchar](1) NULL,
	[portion1] [float] NULL,
	[portion2] [float] NULL,
	[costSecond] [float] NULL,
	[favoriteCode] [int] NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_format] PRIMARY KEY CLUSTERED 
(
	[formatID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[line]    Script Date: 05/09/2013 13:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[line](
	[lineID] [int] IDENTITY(1,1) NOT NULL,
	[brandID] [int] NOT NULL,
	[description] [nvarchar](50) NULL,
	[lineName] [nvarchar](100) NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_line] PRIMARY KEY CLUSTERED 
(
	[lineID] ASC,
	[brandID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[section]    Script Date: 05/09/2013 13:29:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[section](
	[deptID] [int] NOT NULL,
	[sectionID] [int] IDENTITY(1,1) NOT NULL,
	[sectionName] [varchar](100) NULL,
	[reference] [nvarchar](25) NULL,
	[description] [nvarchar](50) NULL,
	[image] [varchar](100) NULL,
	[bgColor] [nvarchar](20) NULL,
	[textColor] [nvarchar](20) NULL,
	[costCenter] [nvarchar](10) NULL,
	[saleAcct] [nvarchar](20) NULL,
	[purchaseAcct] [nvarchar](20) NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_section] PRIMARY KEY CLUSTERED 
(
	[sectionID] ASC,
	[deptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [UNIQUE_section] ON [dbo].[section] 
(
	[deptID] ASC,
	[sectionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[brandSelectInsertUpdateDelete]    Script Date: 05/09/2013 13:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[brandSelectInsertUpdateDelete] 
	-- Add the parameters for the stored procedure here
	@brandID INTEGER = -1,
	@brandName varchar(100) = '',
    @description nvarchar(50) = '',
    -- @image varchar(100) = '',
    -- @bgColor nvarchar(20) = '',
    -- @textColor nvarchar(20) = '',
    -- @costCenter nvarchar(10) = '',
    -- @saleAcct nvarchar(20) = '',
    -- @purchaseAcct nvarchar(20) = '',
    -- @version timestamp,
    -- @createDate nvarchar(100) = '',
    @createUser int = -1,
    -- @lastModified timestamp,
    @modifyUser int = -1,
    @StatementType nvarchar(20) = '',
    
    @newID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- convert datetime from string
	-- SET @createDate = CONVERT(datetime, @createDate);

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'
	BEGIN
	insert into brand ( brandName, description, createDate, lastModified, createUser, modifyUser) values
	(  @brandName, @description, GETDATE(), GETDATE(), @createUser, @modifyUser);
	
	SELECT @newID = SCOPE_IDENTITY();
	END
	
	IF (@StatementType = 'Select' AND @brandID = -1)
	BEGIN
	select * from brand
	END
	
	IF (@StatementType = 'Select' AND @brandID != -1)
	BEGIN
	select * from brand where brandID=@brandID
	END
	
	IF @StatementType = 'Update'
	BEGIN
	UPDATE brand SET
		brandName = @brandName,
		description = @description, 
		-- image = @image, 
		-- bgColor = @bgColor, 
		-- textColor = @textColor, 
		-- costCenter = @costCenter, 
		-- saleAcct = @saleAcct, 
		-- purchaseAcct = @purchaseAcct,
		lastModified = GETDATE(),
		modifyUser = @modifyUser
	WHERE brandId = @brandId
	END
	
	IF @StatementType = 'Delete'
	BEGIN
	DELETE FROM brand WHERE brandId = @brandId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[TestSelectInsertUpdateDelete]    Script Date: 05/09/2013 13:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TestSelectInsertUpdateDelete] 
	-- Add the parameters for the stored procedure here
	@deptID INTEGER = -1,
	@deptName varchar(100) = '',
    @description nvarchar(50) = '',
    @image varchar(100) = '',
    @bgColor nvarchar(20) = '',
    @textColor nvarchar(20) = '',
    @costCenter nvarchar(10) = '',
    @saleAcct nvarchar(20) = '',
    @purchaseAcct nvarchar(20) = '',
    -- @version timestamp,
    -- @createDate nvarchar(100) = '',
    @createUser int = -1,
    -- @lastModified timestamp,
    @modifyUser int = -1,
    @StatementType nvarchar(20) = '',
    
    @newID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- convert datetime from string
	-- SET @createDate = CONVERT(datetime, @createDate);

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'
	BEGIN
	insert into test ( deptName, description, image, bgColor, textColor, costCenter, saleAcct, purchaseAcct, createDate, createUser, modifyUser) values
	(  @deptName, @description, @image, @bgColor, @textColor, @costCenter, @saleAcct, @purchaseAcct, GETDATE(), @createUser, @modifyUser);
	
	SELECT @newID = SCOPE_IDENTITY();
	END
	
	IF @StatementType = 'Select'
	BEGIN
	select * from test
	END
	
	IF @StatementType = 'Update'
	BEGIN
	UPDATE test SET
		deptName = @deptName,
		description = @description, 
		image = @image, 
		bgColor = @bgColor, 
		textColor = @textColor, 
		costCenter = @costCenter, 
		saleAcct = @saleAcct, 
		purchaseAcct = @purchaseAcct, 
		modifyUser = @modifyUser
	WHERE deptId = @deptId
	END
	
	IF @StatementType = 'Delete'
	BEGIN
	DELETE FROM test WHERE deptId = @deptId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[departmentSelectInsertUpdateDelete]    Script Date: 05/09/2013 13:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[departmentSelectInsertUpdateDelete] 
	-- Add the parameters for the stored procedure here
	@deptID INTEGER = -1,
	@deptName varchar(100) = '',
    @description nvarchar(50) = '',
    @image varchar(100) = '',
    @bgColor nvarchar(20) = '',
    @textColor nvarchar(20) = '',
    @costCenter nvarchar(10) = '',
    @saleAcct nvarchar(20) = '',
    @purchaseAcct nvarchar(20) = '',
    -- @version timestamp,
    -- @createDate nvarchar(100) = '',
    @createUser int = -1,
    -- @lastModified timestamp,
    @modifyUser int = -1,
    @StatementType nvarchar(20) = '',
    
    @newID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- convert datetime from string
	-- SET @createDate = CONVERT(datetime, @createDate);

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'
	BEGIN
	insert into department ( deptName, description, image, bgColor, textColor, costCenter, saleAcct, purchaseAcct, createDate, lastModified, createUser, modifyUser) values
	(  @deptName, @description, @image, @bgColor, @textColor, @costCenter, @saleAcct, @purchaseAcct, GETDATE(), GETDATE(), @createUser, @modifyUser);
	
	SELECT @newID = SCOPE_IDENTITY();
	END
	
	IF (@StatementType = 'Select' AND @deptID = -1)
	BEGIN
	select * from department
	END
	
	IF (@StatementType = 'Select' AND @deptID != -1)
	BEGIN
	select * from department where deptID=@deptID
	END
	
	IF @StatementType = 'Update'
	BEGIN
	UPDATE department SET
		deptName = @deptName,
		description = @description, 
		image = @image, 
		bgColor = @bgColor, 
		textColor = @textColor, 
		costCenter = @costCenter, 
		saleAcct = @saleAcct, 
		purchaseAcct = @purchaseAcct,
		lastModified = GETDATE(),
		modifyUser = @modifyUser
	WHERE deptId = @deptId
	END
	
	IF @StatementType = 'Delete'
	BEGIN
	DELETE FROM department WHERE deptId = @deptId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sectionSelectInsertUpdateDelete]    Script Date: 05/09/2013 13:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sectionSelectInsertUpdateDelete] 
	-- Add the parameters for the stored procedure here
	@deptID INTEGER = -1,
	@sectionID INTEGER = -1,
	@sectionName varchar(100) = '',
	@reference varchar(25) = '',
    @description nvarchar(50) = '',
    @image varchar(100) = '',
    @bgColor nvarchar(20) = '',
    @textColor nvarchar(20) = '',
    @costCenter nvarchar(10) = '',
    @saleAcct nvarchar(20) = '',
    @purchaseAcct nvarchar(20) = '',
    -- @version timestamp,
    -- @createDate nvarchar(100) = '',
    @createUser int = -1,
    -- @lastModified timestamp,
    @modifyUser int = -1,
    @StatementType nvarchar(20) = '',
    
    @newID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- convert datetime from string
	-- SET @createDate = CONVERT(datetime, @createDate);

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'
	BEGIN
	insert into section ( deptID, sectionName, reference, description, image, bgColor, textColor, costCenter, saleAcct, purchaseAcct, createDate, lastModified, createUser, modifyUser) values
	( @deptID, @sectionName, @reference, @description, @image, @bgColor, @textColor, @costCenter, @saleAcct, @purchaseAcct, GETDATE(), GETDATE(), @createUser, @modifyUser);
	
	SELECT @newID = SCOPE_IDENTITY();
	END
	
	IF (@StatementType = 'Select' AND @deptID = -1)
	BEGIN
	select * from section
	END
	
	IF (@StatementType = 'Select' AND @deptID != -1 AND @sectionID != -1)
	BEGIN
	select * from section where deptID=@deptID and sectionID=@sectionID
	END
	
	IF @StatementType = 'Update'
	BEGIN
	UPDATE section SET
		deptId = @deptId,
		sectionName = @sectionName,
		reference = @reference,
		description = @description, 
		image = @image, 
		bgColor = @bgColor, 
		textColor = @textColor, 
		costCenter = @costCenter, 
		saleAcct = @saleAcct, 
		purchaseAcct = @purchaseAcct, 
		lastModified = GETDATE(),
		modifyUser = @modifyUser
	WHERE deptId = @deptId and sectionID=@sectionID
	END
	
	IF @StatementType = 'Delete'
	BEGIN
	DELETE FROM section WHERE deptId = @deptId and sectionID=@sectionID
	END
END
GO
/****** Object:  Table [dbo].[family]    Script Date: 05/09/2013 13:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[family](
	[deptID] [int] NOT NULL,
	[sectionID] [int] NOT NULL,
	[familyID] [int] IDENTITY(1,1) NOT NULL,
	[familyName] [varchar](100) NULL,
	[reference] [nvarchar](25) NULL,
	[description] [nvarchar](50) NULL,
	[image] [varchar](100) NULL,
	[bgColor] [nvarchar](20) NULL,
	[textColor] [nvarchar](20) NULL,
	[costCenter] [nvarchar](10) NULL,
	[saleAcct] [nvarchar](20) NULL,
	[purchaseAcct] [nvarchar](20) NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_family] PRIMARY KEY CLUSTERED 
(
	[deptID] ASC,
	[sectionID] ASC,
	[familyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [UNIQUE_family] ON [dbo].[family] 
(
	[deptID] ASC,
	[sectionID] ASC,
	[familyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[lineSelectInsertUpdateDelete]    Script Date: 05/09/2013 13:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lineSelectInsertUpdateDelete] 
	-- Add the parameters for the stored procedure here
	@brandID INTEGER = -1,
	@lineID INTEGER = -1,
	@lineName varchar(100) = '',
    @description nvarchar(50) = '',
    -- @image varchar(100) = '',
    -- @bgColor nvarchar(20) = '',
    -- @textColor nvarchar(20) = '',
    -- @costCenter nvarchar(10) = '',
    -- @saleAcct nvarchar(20) = '',
    -- @purchaseAcct nvarchar(20) = '',
    -- @version timestamp,
    -- @createDate nvarchar(100) = '',
    @createUser int = -1,
    -- @lastModified timestamp,
    @modifyUser int = -1,
    @StatementType nvarchar(20) = '',
    
    @newID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- convert datetime from string
	-- SET @createDate = CONVERT(datetime, @createDate);

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'
	BEGIN
	insert into line ( brandID, lineName, description, createDate, lastModified, createUser, modifyUser) values
	( @brandID, @lineName, @description, GETDATE(), GETDATE(), @createUser, @modifyUser);
	
	SELECT @newID = SCOPE_IDENTITY();
	END
	
	IF (@StatementType = 'Select' AND @brandID = -1 AND @lineID = -1)
	BEGIN
	select * from line
	END
	
	IF (@StatementType = 'Select' AND @brandID != -1 AND @lineID != -1)
	BEGIN
	select * from line where brandID=@brandID and lineID=@lineID
	END
	
	IF @StatementType = 'Update'
	BEGIN
	UPDATE line SET
		brandID = @brandID,
		lineName = @lineName,
		description = @description, 
		-- image = @image, 
		-- bgColor = @bgColor, 
		-- textColor = @textColor, 
		-- costCenter = @costCenter, 
		-- saleAcct = @saleAcct, 
		-- purchaseAcct = @purchaseAcct,
		lastModified = GETDATE(),
		modifyUser = @modifyUser
	WHERE brandId = @brandId and lineID=@lineID
	END
	
	IF @StatementType = 'Delete'
	BEGIN
	DELETE FROM line WHERE brandId = @brandId and lineID=@lineID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[familySelectInsertUpdateDelete]    Script Date: 05/09/2013 13:29:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[familySelectInsertUpdateDelete] 
	-- Add the parameters for the stored procedure here
	@deptID INTEGER = -1,
	@sectionID INTEGER = -1,
	@familyID INTEGER = -1,
	@familyName varchar(100) = '',
	@reference varchar(25) = '',
    @description nvarchar(50) = '',
    @image varchar(100) = '',
    @bgColor nvarchar(20) = '',
    @textColor nvarchar(20) = '',
    @costCenter nvarchar(10) = '',
    @saleAcct nvarchar(20) = '',
    @purchaseAcct nvarchar(20) = '',
    -- @version timestamp,
    -- @createDate nvarchar(100) = '',
    @createUser int = -1,
    -- @lastModified timestamp,
    @modifyUser int = -1,
    @StatementType nvarchar(20) = '',
    
    @newID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- convert datetime from string
	-- SET @createDate = CONVERT(datetime, @createDate);

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'
	BEGIN
	insert into family ( deptID, sectionID, familyName, reference, description, image, bgColor, textColor, costCenter, saleAcct, purchaseAcct, createDate, lastModified, createUser, modifyUser) values
	( @deptID, @sectionID, @familyName, @reference, @description, @image, @bgColor, @textColor, @costCenter, @saleAcct, @purchaseAcct, GETDATE(), GETDATE(), @createUser, @modifyUser);
	
	SELECT @newID = SCOPE_IDENTITY();
	END
	
	IF (@StatementType = 'Select' AND @deptID = -1)
	BEGIN
	select * from family
	END
	
	IF (@StatementType = 'Select' AND @deptID != -1 AND @sectionID != -1 AND @familyID != -1)
	BEGIN
	select * from family where deptID=@deptID and sectionID=@sectionID and familyID=@familyID
	END
	
	IF @StatementType = 'Update'
	BEGIN
	UPDATE family SET
		deptId = @deptId,
		sectionID=@sectionID,
		familyName = @familyName,
		reference = @reference,
		description = @description, 
		image = @image, 
		bgColor = @bgColor, 
		textColor = @textColor, 
		costCenter = @costCenter, 
		saleAcct = @saleAcct, 
		purchaseAcct = @purchaseAcct,
		lastModified = GETDATE(),
		modifyUser = @modifyUser
	WHERE deptId = @deptId and sectionID=@sectionID and familyID=@familyID
	END
	
	IF @StatementType = 'Delete'
	BEGIN
	DELETE FROM family WHERE deptId = @deptId and sectionID=@sectionID and familyID=@familyID
	END
END
GO
/****** Object:  ForeignKey [FK_brad_line]    Script Date: 05/09/2013 13:29:53 ******/
ALTER TABLE [dbo].[line]  WITH CHECK ADD  CONSTRAINT [FK_brad_line] FOREIGN KEY([brandID])
REFERENCES [dbo].[brand] ([brandID])
GO
ALTER TABLE [dbo].[line] CHECK CONSTRAINT [FK_brad_line]
GO
/****** Object:  ForeignKey [FK_section_department]    Script Date: 05/09/2013 13:29:53 ******/
ALTER TABLE [dbo].[section]  WITH CHECK ADD  CONSTRAINT [FK_section_department] FOREIGN KEY([deptID])
REFERENCES [dbo].[department] ([deptID])
GO
ALTER TABLE [dbo].[section] CHECK CONSTRAINT [FK_section_department]
GO
/****** Object:  ForeignKey [FK_family_section]    Script Date: 05/09/2013 13:29:54 ******/
ALTER TABLE [dbo].[family]  WITH CHECK ADD  CONSTRAINT [FK_family_section] FOREIGN KEY([deptID], [sectionID])
REFERENCES [dbo].[section] ([deptID], [sectionID])
GO
ALTER TABLE [dbo].[family] CHECK CONSTRAINT [FK_family_section]
GO
