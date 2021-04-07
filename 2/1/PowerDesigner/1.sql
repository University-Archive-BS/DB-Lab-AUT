/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     4/5/2021 11:13:13 PM                         */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Reserve') and o.name = 'RESERVE_BOAT')
alter table Reserve
   drop constraint RESERVE_BOAT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Reserve') and o.name = 'RESERVE_SAILOR')
alter table Reserve
   drop constraint RESERVE_SAILOR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Boat')
            and   type = 'U')
   drop table Boat
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Reserve')
            and   name  = 'Sailor_Reserve_FK'
            and   indid > 0
            and   indid < 255)
   drop index Reserve.Sailor_Reserve_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Reserve')
            and   name  = 'Boat_Reserve_FK'
            and   indid > 0
            and   indid < 255)
   drop index Reserve.Boat_Reserve_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Reserve')
            and   type = 'U')
   drop table Reserve
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sailor')
            and   type = 'U')
   drop table Sailor
go

/*==============================================================*/
/* Table: Boat                                                  */
/*==============================================================*/
create table Boat (
   Boat_name            varchar(50)          not null,
   Boat_color           varchar(20)          not null,
   Boat_rank            varchar(30)          not null,
   constraint PK_BOAT primary key (Boat_name)
)
go

/*==============================================================*/
/* Table: Reserve                                               */
/*==============================================================*/
create table Reserve (
   Sailor_name          varchar(50)          not null,
   Boat_name            varchar(50)          not null,
   Weekday              varchar(20)          not null,
   constraint PK_RESERVE primary key (Sailor_name, Boat_name)
)
go

/*==============================================================*/
/* Index: Boat_Reserve_FK                                       */
/*==============================================================*/




create nonclustered index Boat_Reserve_FK on Reserve (Boat_name ASC)
go

/*==============================================================*/
/* Index: Sailor_Reserve_FK                                     */
/*==============================================================*/




create nonclustered index Sailor_Reserve_FK on Reserve (Sailor_name ASC)
go

/*==============================================================*/
/* Table: Sailor                                                */
/*==============================================================*/
create table Sailor (
   Sailor_name          varchar(50)          not null,
   Sailor_rank          int                  not null,
   constraint PK_SAILOR primary key (Sailor_name)
)
go

alter table Reserve
   add constraint RESERVE_BOAT foreign key (Boat_name)
      references Boat (Boat_name)
go

alter table Reserve
   add constraint RESERVE_SAILOR foreign key (Sailor_name)
      references Sailor (Sailor_name)
go

