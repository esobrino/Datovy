
CREATE TABLE Core.Entity_Uri
(
   [Organization_ID]       VARCHAR(30) NOT NULL,
	[Entity_ID]             VARCHAR(30) NOT NULL,
   [URI_ID]                VARCHAR(30) PRIMARY KEY,
   [Type_ID]               VARCHAR(30) NULL,
   [Absolute_URI]          VARCHAR(1028) NULL,
   [Category_Code_ID]      VARCHAR(30) NULL,
   [Category_Text]         VARCHAR(80) NULL,

   [Status_Code_ID]        VARCHAR (30)  NULL,
   [Status_DateTime]       DATETIMEOFFSET   NULL,
   [Start_DateTime]        DATETIMEOFFSET   NULL,
   [End_DateTime]          DATETIMEOFFSET   NULL,

   [Tenant_ID]             VARCHAR(30) NOT NULL,
   [Data_Owner_ID]         VARCHAR(30) NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Version_Number]        VARCHAR(20),
   [Sequence_Number]       INTEGER NULL,
   [Created_DateTime]      DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NOT NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40),

   CONSTRAINT FK_EntityUriType FOREIGN KEY ([Type_ID])
      REFERENCES Code.Entity_Uri_Type(Type_ID)
)
GO
