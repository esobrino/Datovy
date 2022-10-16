CREATE TABLE Core.Entity_Uri
(
   [Organization_ID]       VARCHAR(30) NOT NULL,
	[Entity_ID]             VARCHAR(30) NOT NULL,
   [URI_ID]                VARCHAR(30) NOT NULL,
   [Type_ID]               VARCHAR(30) NULL,
   [Absolute_URI]          VARCHAR(1028) NULL,
   [Category_Code_ID]      VARCHAR(30) NULL,
   [Category_Text]         VARCHAR(80) NULL,

   [Status_Code_ID]        VARCHAR (30)  NULL,
   [Status_DateTime]       DATETIMEOFFSET   NULL,

   -- record management
   [Tenant_ID]             VARCHAR(30) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]         VARCHAR(30) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Efective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Efective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT pk_Uri PRIMARY KEY (URI_ID),
   CONSTRAINT fk_Uri_Type FOREIGN KEY ([Type_ID])
      REFERENCES Core.Uri_Type(Type_ID)
)
GO
