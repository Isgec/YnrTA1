SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sptaD_LocalTravelSelectByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sptaD_LocalTravelSelectByID]
GO
 
CREATE PROCEDURE [dbo].[sptaD_LocalTravelSelectByID]
  @LoginID NVarChar(8),
  @SerialNo Int 
  AS
  SELECT
    [TA_D_LocalTravel].* ,
    [TA_Categories1].[cmba] AS TA_Categories1_cmba 
  FROM [TA_D_LocalTravel] 
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_LocalTravel].[CategoryID] = [TA_Categories1].[CategoryID]
  WHERE
  [TA_D_LocalTravel].[SerialNo] = @SerialNo
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sptaD_LocalTravelSelectListSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sptaD_LocalTravelSelectListSearch]
GO
 
CREATE PROCEDURE [dbo].[sptaD_LocalTravelSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo)
  SELECT [TA_D_LocalTravel].[SerialNo] FROM [TA_D_LocalTravel]
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_LocalTravel].[CategoryID] = [TA_Categories1].[CategoryID]
 WHERE  
   ( 
         STR(ISNULL([TA_D_LocalTravel].[SerialNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_D_LocalTravel].[CategoryID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([TA_D_LocalTravel].[TravelDA], 0)) LIKE @KeyWord1
   ) 
  ORDER BY (Select @OrderBy)

    SET @RecordCount = @@RowCount

  SELECT
    [TA_D_LocalTravel].* ,
    [TA_Categories1].[cmba] AS TA_Categories1_cmba 
  FROM [TA_D_LocalTravel] 
      INNER JOIN #PageIndex
          ON [TA_D_LocalTravel].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_LocalTravel].[CategoryID] = [TA_Categories1].[CategoryID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sptaD_LocalTravelSelectListFilteres]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sptaD_LocalTravelSelectListFilteres]
GO
 
CREATE PROCEDURE [dbo].[sptaD_LocalTravelSelectListFilteres]
  @Filter_CategoryID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  IF (@OrderBy = '')
    SET @OrderBy = 'SerialNo'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL +=  'SerialNo'
  SET @LGSQL +=  ')'
  SET @LGSQL +=  ' SELECT '
  SET @LGSQL +=  '[TA_D_LocalTravel].[SerialNo]'
  SET @LGSQL +=  ' FROM [TA_D_LocalTravel] '
  SET @LGSQL +=  '  INNER JOIN [TA_Categories] AS [TA_Categories1]'
  SET @LGSQL +=  '    ON [TA_D_LocalTravel].[CategoryID] = [TA_Categories1].[CategoryID]'
  SET @LGSQL +=  '  WHERE 1 = 1 '
  IF (@Filter_CategoryID > 0) 
    SET @LGSQL +=  ' AND [TA_D_LocalTravel].[CategoryID] = ' + STR(@Filter_CategoryID)
  SET @LGSQL +=  '  ORDER BY ' + @OrderBy
 
 
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [TA_D_LocalTravel].* ,
    [TA_Categories1].[cmba] AS TA_Categories1_cmba 
  FROM [TA_D_LocalTravel] 
      INNER JOIN #PageIndex
          ON [TA_D_LocalTravel].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [TA_Categories] AS [TA_Categories1]
    ON [TA_D_LocalTravel].[CategoryID] = [TA_Categories1].[CategoryID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sptaD_LocalTravelInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sptaD_LocalTravelInsert]
GO
 
CREATE PROCEDURE [dbo].[sptaD_LocalTravelInsert]
  @CategoryID Int,
  @TravelDA Decimal(10,2),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [TA_D_LocalTravel]
  (
   [CategoryID]
  ,[TravelDA]
  ,[FromDate]
  ,[TillDate]
  ,[Active]
  )
  VALUES
  (
   @CategoryID
  ,@TravelDA
  ,@FromDate
  ,@TillDate
  ,@Active
  )
  SET @Return_SerialNo = Scope_Identity()
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sptaD_LocalTravelUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sptaD_LocalTravelUpdate]
GO
 
CREATE PROCEDURE [dbo].[sptaD_LocalTravelUpdate]
  @Original_SerialNo Int, 
  @CategoryID Int,
  @TravelDA Decimal(10,2),
  @FromDate DateTime,
  @TillDate DateTime,
  @Active Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_D_LocalTravel] SET 
   [CategoryID] = @CategoryID
  ,[TravelDA] = @TravelDA
  ,[FromDate] = @FromDate
  ,[TillDate] = @TillDate
  ,[Active] = @Active
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sptaD_LocalTravelDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sptaD_LocalTravelDelete]
GO
 
CREATE PROCEDURE [dbo].[sptaD_LocalTravelDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_D_LocalTravel]
  WHERE
  [TA_D_LocalTravel].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
  GO

SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
