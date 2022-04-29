-- Задание 1

use UNIVER;
exec sp_helpindex 'AUDITORIUM'
exec sp_helpindex 'AUDITORIUM_TYPE'
exec sp_helpindex 'FACULTY'
exec sp_helpindex 'GROUP1'
exec sp_helpindex 'GROUPS'
exec sp_helpindex 'PROFESSION'
exec sp_helpindex 'PROGRESS'
exec sp_helpindex 'PULPIT'
exec sp_helpindex 'STUD'
exec sp_helpindex 'STUDENT'
exec sp_helpindex 'SUBJECT_T'
exec sp_helpindex 'TEACHER'

GO
CREATE table #EXPLRE
( TIND int,
  TFIELD varchar (100)
)

SET nocount on;
DECLARE @i int = 0;
WHILE @i<1000
begin
	INSERT #EXPLRE(TIND, TFIELD)
		values(floor(20000*RAND()), REPLICATE('строка',10));
IF(@i%100=0) print @i; 
SET @i=@i+1;
end;

SELECT *FROM #EXPLRE WHERE TIND BETWEEN 150 AND 250 order by TIND

checkpoint;
DBCC DROPCLEANBUFFERS;

CREATE clustered index ##EXAMPLE_1_CL on #EXPLRE(TIND asc);

SELECT *
FROM #EXPLRE
WHERE TIND BETWEEN 150 AND 250
ORDER BY TIND;

-- Задание 2
GO
CREATE table #EX
( TKEY int,
  CC int identity(1,1),
  TF varchar (100));
	set nocount on;
	declare @j int = 0;
	while @j < 10000
	begin
		INSERT #EX(TKEY, TF) values(floor(30000*RAND()), replicate('жаба', 1));
		set @j=@j+1;
	end;

	SELECT count(*)[количество строк] from #EX;
	SELECT * from #EX

checkpoint;
DBCC DROPCLEANBUFFERS;

	CREATE index #EX_NONCLU on #EX(TKEY, CC)
	SELECT *FROM #EX where TKEY>1500 and CC<4500;
	SELECT *FROM #EX order by TKEY, CC;
	SELECT *FROM #EX where TKEY=566 and CC>3;

-- Задание 3
GO
CREATE table #EX_2
( TK int,
  AA int identity(1,1),
  YF varchar (100));
	set nocount on;
	declare @a int = 0;
	while @a < 10000
	begin
		INSERT #EX_2(TK, YF) values(floor(30000*RAND()), replicate('жаба', 1));
		set @a=@a+1;
	end;

checkpoint;
DBCC DROPCLEANBUFFERS;

CREATE index #EX_TKEY_X on #EX_2(TK) INCLUDE (AA)
SELECT AA from #EX_2 where TK>15000;

--Задача 4
GO
CREATE table #EXAMPLE_4
( EX int,
  BB int identity (1,1),
  UF varchar (100));
  set nocount on;
  declare @r int =0;
  while @r < 1000
  begin 
	INSERT #EXAMPLE_4(EX, UF) values (floor(1000*RAND()), REPLICATE('красная жаба',1));
	set @r = @r+1;
end;

SELECT *FROM #EXAMPLE_4 where EX between 500 and 1000 order by EX

checkpoint;
DBCC DROPCLEANBUFFERS;

GO
CREATE index ##EXAMPLE_4_CL on #EXAMPLE_4(EX) where (EX>=500 and EX<1000);
SELECT *FROM #EXAMPLE_4 where EX between 500 and 1000 order by EX;


--Задача 5

GO
CREATE table #EX_5
( JB int,
  OO int identity (1,1),
  PF varchar (100));
  set nocount on;
  declare @o int =0;
  while @o < 1000
  begin 
	INSERT #EX_5(JB, PF) values (floor(1000*RAND()), REPLICATE('синяя жаба',1));
	set @o = @o+1;
end;

SELECT *FROM #EX_5 where JB between 500 and 1000 order by JB;

GO
CREATE index #EX_TKEY ON #EX_5(JB);
  SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
          FROM sys.dm_db_index_physical_stats(DB_ID(N'#EXAMPLE_5'),
NULL, NULL, NULL, NULL) ss
        JOIN sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id  
                                                                 WHERE name is not null;
										
	 INSERT top(10000) #EX_5(JB, PF) select JB, PF from #EX_5;
	 ALTER index #EX_TKEY on #EX_5 reorganize;
	 ALTER index #EX_TKEY on #EX_5 rebuild with (online = off);

--Задание 6

GO
CREATE table #EX_6
( QQ int,
  WW int identity (1,1),
  EE varchar (100));
  set nocount on;
  declare @p int =0;
  while @p < 1000
  begin 
	INSERT #EX_6(QQ, EE) values (floor(1000*RAND()), REPLICATE('синяя жаба',1));
	set @p = @p+1;
end;

 CREATE index #EX_TKEY on #EX_6(QQ)
 with (fillfactor = 65);

     INSERT top(50)percent INTO #EX(TKEY, TF) SELECT TKEY, TF  FROM #EX;
SELECT  name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
       FROM sys.dm_db_index_physical_stats(DB_ID(N'#EX_6'),
NULL, NULL, NULL, NULL) ss  JOIN sys.indexes ii 
                                     ON ss.object_id = ii.object_id and ss.index_id = ii.index_id  
                                                                           WHERE name is not null;
