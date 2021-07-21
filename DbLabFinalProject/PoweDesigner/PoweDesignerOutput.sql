/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     7/16/2021 4:07:01 PM                         */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Comment') and o.name = 'FK_COMMENT_RELATIONS_Customer')
alter table Comment
   drop constraint FK_COMMENT_RELATIONS_Customer
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Comment') and o.name = 'FK_COMMENT_RELATIONS_PRODUCT')
alter table Comment
   drop constraint FK_COMMENT_RELATIONS_PRODUCT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Discount') and o.name = 'FK_DISCOUNT_RELATIONS_Customer')
alter table Discount
   drop constraint FK_DISCOUNT_RELATIONS_Customer
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Discount') and o.name = 'FK_DISCOUNT_RELATIONS_ORDER')
alter table Discount
   drop constraint FK_DISCOUNT_RELATIONS_ORDER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"Order"') and o.name = 'FK_ORDER_RELATIONS_Customer')
alter table "Order"
   drop constraint FK_ORDER_RELATIONS_Customer
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('"Order"') and o.name = 'FK_ORDER_RELATIONS_DISCOUNT')
alter table "Order"
   drop constraint FK_ORDER_RELATIONS_DISCOUNT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('OrderItem') and o.name = 'FK_ORDERITE_RELATIONS_ORDER')
alter table OrderItem
   drop constraint FK_ORDERITE_RELATIONS_ORDER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('OrderItem') and o.name = 'FK_ORDERITE_RELATIONS_PRODUCT')
alter table OrderItem
   drop constraint FK_ORDERITE_RELATIONS_PRODUCT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Comment')
            and   name  = 'Relationship_5_FK'
            and   indid > 0
            and   indid < 255)
   drop index Comment.Relationship_5_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Comment')
            and   name  = 'Relationship_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index Comment.Relationship_4_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Comment')
            and   type = 'U')
   drop table Comment
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Discount')
            and   name  = 'Relationship_8_FK'
            and   indid > 0
            and   indid < 255)
   drop index Discount.Relationship_8_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Discount')
            and   name  = 'Relationship_6_FK'
            and   indid > 0
            and   indid < 255)
   drop index Discount.Relationship_6_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Discount')
            and   type = 'U')
   drop table Discount
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"Order"')
            and   name  = 'Relationship_7_FK'
            and   indid > 0
            and   indid < 255)
   drop index "Order".Relationship_7_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"Order"')
            and   name  = 'Relationship_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index "Order".Relationship_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"Order"')
            and   type = 'U')
   drop table "Order"
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('OrderItem')
            and   name  = 'Relationship_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index OrderItem.Relationship_2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('OrderItem')
            and   type = 'U')
   drop table OrderItem
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Product')
            and   type = 'U')
   drop table Product
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Customer')
            and   type = 'U')
   drop table Customer
go

/*==============================================================*/
/* Table: Comment                                               */
/*==============================================================*/
create table Comment (
   UUId                 bigint               not null,
   ProductId            bigint               not null,
   Text                 varchar(1000)        not null,
   Score                int                  not null
)
go

/*==============================================================*/
/* Index: Relationship_4_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_4_FK on Comment (UUId ASC)
go

/*==============================================================*/
/* Index: Relationship_5_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_5_FK on Comment (ProductId ASC)
go

/*==============================================================*/
/* Table: Discount                                              */
/*==============================================================*/
create table Discount (
   DiscountId           int                  not null,
   UUId                 bigint               not null,
   OrderId              bigint               null,
   Code                 varchar(256)         not null,
   Amount               int                  not null,
   IsActive             bit                  not null,
   constraint PK_DISCOUNT primary key (DiscountId)
)
go

/*==============================================================*/
/* Index: Relationship_6_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_6_FK on Discount (UUId ASC)
go

/*==============================================================*/
/* Index: Relationship_8_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_8_FK on Discount (OrderId ASC)
go

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
create table "Order" (
   OrderId              bigint               not null,
   UUId                 bigint               not null,
   DiscountId           int                  null,
   TotalPrice           int                  not null,
   CreationTime         datetime             not null,
   PaidAmount            int                  not null,
   constraint PK_ORDER primary key (OrderId)
)
go

/*==============================================================*/
/* Index: Relationship_1_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_1_FK on "Order" (UUId ASC)
go

/*==============================================================*/
/* Index: Relationship_7_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_7_FK on "Order" (DiscountId ASC)
go

/*==============================================================*/
/* Table: OrderItem                                             */
/*==============================================================*/
create table OrderItem (
   ItemId               bigint               not null,
   ProductId            bigint               not null,
   OrderId              bigint               not null,
   Fee                  int                  not null,
   Count                int                  not null,
   constraint PK_ORDERITEM primary key (ItemId)
)
go

/*==============================================================*/
/* Index: Relationship_2_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_2_FK on OrderItem (OrderId ASC)
go

/*==============================================================*/
/* Table: Product                                               */
/*==============================================================*/
create table Product (
   ProductId            bigint               not null,
   RemainingCount       int                  not null,
   Price                int                  not null,
   Categoty             int                  not null,
   ProductName          varchar(50)          not null,
   constraint PK_PRODUCT primary key (ProductId)
)
go

/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
create table Customer (
   UUId                 bigint               not null,
   UserName             varchar(256)         not null,
   Pasword              varchar(256)         not null,
   PhoneNumber          varchar(11)          not null,
   Reference            bigint               null,
   Score                int                  not null,
   constraint PK_Customer primary key (UUId)
)
go

alter table Comment
   add constraint FK_COMMENT_RELATIONS_Customer foreign key (UUId)
      references Customer (UUId)
go

alter table Comment
   add constraint FK_COMMENT_RELATIONS_PRODUCT foreign key (ProductId)
      references Product (ProductId)
go

alter table Discount
   add constraint FK_DISCOUNT_RELATIONS_Customer foreign key (UUId)
      references Customer (UUId)
go

alter table "Order"
   add constraint FK_ORDER_RELATIONS_Customer foreign key (UUId)
      references Customer (UUId)
go

alter table "Order"
   add constraint FK_ORDER_RELATIONS_DISCOUNT foreign key (DiscountId)
      references Discount (DiscountId)
go

alter table OrderItem
   add constraint FK_ORDERITE_RELATIONS_ORDER foreign key (OrderId)
      references "Order" (OrderId)
go

alter table OrderItem
   add constraint FK_ORDERITE_RELATIONS_PRODUCT foreign key (ProductId)
      references Product (ProductId)
go

