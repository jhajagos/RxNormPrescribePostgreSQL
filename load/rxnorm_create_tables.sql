create schema if not exists rxnorm;

DROP  TABLE IF EXISTS rxnorm.RXNATOMARCHIVE;
CREATE TABLE rxnorm.RXNATOMARCHIVE
(
   RXAUI             varchar(8) NOT NULL,
   AUI               varchar(10),
   STR               varchar(4000) NOT NULL,
   ARCHIVE_TIMESTAMP varchar(280) NOT NULL,
   CREATED_TIMESTAMP varchar(280) NOT NULL,
   UPDATED_TIMESTAMP varchar(280) NOT NULL,
   CODE              varchar(50),
   IS_BRAND          varchar(1),
   LAT               varchar(3),
   LAST_RELEASED     varchar(30),
   SAUI              varchar(50),
   VSAB              varchar(40),
   RXCUI             varchar(8),
   SAB               varchar(20),
   TTY               varchar(20),
   MERGED_TO_RXCUI   varchar(8),
   t varchar(1)
)
;

DROP  TABLE IF EXISTS rxnorm.RXNCONSO;
CREATE TABLE rxnorm.RXNCONSO
(
   RXCUI             varchar(8) NOT NULL,
   LAT               varchar (3) DEFAULT 'ENG' NOT NULL,
   TS                varchar (1),
   LUI               varchar(8),
   STT               varchar (3),
   SUI               varchar (8),
   ISPREF            varchar (1),
   RXAUI             varchar(8) NOT NULL,
   SAUI              varchar (50),
   SCUI              varchar (50),
   SDUI              varchar (50),
   SAB               varchar (20) NOT NULL,
   TTY               varchar (20) NOT NULL,
   CODE              varchar (50) NOT NULL,
   STR               varchar (3000) NOT NULL,
   SRL               varchar (10),
   SUPPRESS          varchar (1),
   CVF               varchar(50),
   t varchar(1)
)
;

DROP TABLE IF EXISTS rxnorm.RXNREL;
CREATE TABLE rxnorm.RXNREL
(
   RXCUI1    varchar(8) ,
   RXAUI1    varchar(8),
   STYPE1    varchar(50),
   REL       varchar(4) ,
   RXCUI2    varchar(8) ,
   RXAUI2    varchar(8),
   STYPE2    varchar(50),
   RELA      varchar(100) ,
   RUI       varchar(10),
   SRUI      varchar(50),
   SAB       varchar(20) NOT NULL,
   SL        varchar(1000),
   DIR       varchar(1),
   RG        varchar(10),
   SUPPRESS  varchar(1),
   CVF       varchar(50),
   t varchar(1)
)
;

DROP TABLE IF EXISTS rxnorm.RXNSAB;
CREATE TABLE rxnorm.RXNSAB
(
   VCUI           varchar (8),
   RCUI           varchar (8),
   VSAB           varchar (40),
   RSAB           varchar (20) NOT NULL,
   SON            varchar (3000),
   SF             varchar (20),
   SVER           varchar (20),
   VSTART         varchar (10),
   VEND           varchar (10),
   IMETA          varchar (10),
   RMETA          varchar (10),
   SLC            varchar (1000),
   SCC            varchar (1000),
   SRL            integer,
   TFR            integer,
   CFR            integer,
   CXTY           varchar (50),
   TTYL           varchar (300),
   ATNL           varchar (1000),
   LAT            varchar (3),
   CENC           varchar (20),
   CURVER         varchar (1),
   SABIN          varchar (1),
   SSN            varchar (3000),
   SCIT           varchar (4000),
   t varchar(1)
)
;

DROP TABLE IF EXISTS rxnorm.RXNSAT;
CREATE TABLE rxnorm.RXNSAT
(
   RXCUI            varchar(8) ,
   LUI              varchar(8),
   SUI              varchar(8),
   RXAUI            varchar(9),
   STYPE            varchar (50),
   CODE             varchar (50),
   ATUI             varchar(11),
   SATUI            varchar (50),
   ATN              varchar (1000) NOT NULL,
   SAB              varchar (20) NOT NULL,
   ATV              varchar (4000),
   SUPPRESS         varchar (1),
   CVF              varchar (50),
   t varchar(1)
)
;

DROP TABLE IF EXISTS rxnorm.RXNSTY;
CREATE TABLE rxnorm.RXNSTY
(
   RXCUI          varchar(8) NOT NULL,
   TUI            varchar (4),
   STN            varchar (100),
   STY            varchar (50),
   ATUI           varchar (11),
   CVF            varchar (50),
   t varchar(1)
)
;

DROP TABLE IF EXISTS rxnorm.RXNDOC;
CREATE TABLE rxnorm.RXNDOC (
    DOCKEY      varchar(50) NOT NULL,
    VALUE       varchar(1000),
    TYPE        varchar(50) NOT NULL,
    EXPL        varchar(1000),
   t varchar(1)
)
;

DROP  TABLE IF EXISTS  rxnorm.RXNCUICHANGES;
CREATE TABLE rxnorm.RXNCUICHANGES
(
      RXAUI         varchar(8),
      CODE          varchar(50),
      SAB           varchar(20),
      TTY           varchar(20),
      STR           varchar(3000),
      OLD_RXCUI     varchar(8) NOT NULL,
      NEW_RXCUI     varchar(8) NOT NULL,
   t varchar(1)
)
;

DROP  TABLE IF EXISTS  rxnorm.RXNCUI;
 CREATE TABLE rxnorm.RXNCUI (
 cui1 VARCHAR(8),
 ver_start VARCHAR(40),
 ver_end   VARCHAR(40),
 cardinality VARCHAR(8),
 cui2       VARCHAR(8) ,
   t varchar(1)
)
;
