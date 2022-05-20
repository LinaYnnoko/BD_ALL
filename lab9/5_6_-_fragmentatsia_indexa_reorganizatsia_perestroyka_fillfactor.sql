use tempdb
create table #TEMP_TABLE5
(TKEY int, 
CC int identity(1, 1),
TF varchar(100)
);

set nocount on;
declare @i int = 0;
while @i < 10000
begin
insert #TEMP_TABLE5(TKEY, TF)
		values(floor(rand()*20000), REPLICATE('строка', 1))
		SET @i = @i + 1; 
	end;

create index #TEMP_TABLE5_NONCLU on #TEMP_TABLE5(TKEY);

select name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
		from sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),
		OBJECT_ID(N'#TEMP_TABLE5'), NULL, NULL, NULL) SS
		join sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id
		where name is not null;

insert top(10000) #TEMP_TABLE5(TKEY, TF) select TKEY, TF from #TEMP_TABLE5;

alter index #TEMP_TABLE5_NONCLU on #TEMP_TABLE5 reorganize;
alter index #TEMP_TABLE5_NONCLU on #TEMP_TABLE5 rebuild with (online = off);



DROP index #TEMP_TABLE5_NONCLU1 on #TEMP_TABLE5;

CREATE index #TEMP_TABLE5_NONCLU1 on #TEMP_TABLE5(TKEY)
                                 with (fillfactor = 65);

INSERT top(50) percent into #TEMP_TABLE5(TKEY, TF) 
select TKEY, TF  from #TEMP_TABLE5; 

select name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
		from sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),
		OBJECT_ID(N'#TEMP_TABLE5'), NULL, NULL, NULL) SS
		join sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id
		where name is not null;