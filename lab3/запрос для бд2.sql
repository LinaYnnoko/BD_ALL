use master  
create database E_MyBase2 
on primary
( name = N'E_MyBase2_mdf', filename = N'L:\BD\E_MyBase2.mdf', 
   size = 10240Kb, maxsize=UNLIMITED, filegrowth=1024Kb),
( name = N'E_MyBase2_ndf', filename = N'L:\BD\E_MyBase2_ndf.ndf', 
   size = 10240KB, maxsize=1Gb, filegrowth=25%),
filegroup FG1
( name = N'E_MyBase2_fg1_1', filename = N'L:\BD\E_MyBase2_fgq-1.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%),
( name = N'E_MyBase2_fg1_2', filename = N'L:\BD\E_MyBase2_fgq-2.ndf', 
   size = 10240Kb, maxsize=1Gb, filegrowth=25%)
log on
( name = N'E_MyBase2_log', filename=N'L:\BD\E_MyBase2_log.ldf',       
   size=10240Kb,  maxsize=2048Gb, filegrowth=10%)
