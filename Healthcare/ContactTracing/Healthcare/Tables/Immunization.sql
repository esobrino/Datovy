CREATE TABLE [Healthcare].[Immunization] (
   [Immunization_ID]       VARCHAR (30)  NOT NULL,
   [Activity_ID]           VARCHAR (30)  NULL,
   [Organization_ID]       VARCHAR (30)  NULL,
   [Immunization_Type_ID]  VARCHAR (30)  NULL,
   [Administered_DateTime] DATETIMEOFFSET   NULL,
   [Dosage_SeriesNumber]   VARCHAR (20)  NULL,
   [Dosage_Amount]         VARCHAR (50)  NULL,
   [Lot_Number]            VARCHAR (20)  NULL,
   [Expiration_Date]       DATETIME2 (7) NULL,
   [Drug_Code_ID]          VARCHAR (30)  NULL,
   
   [Status_Code_ID]        VARCHAR(30) NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,
   [Start_DateTime]        DATETIMEOFFSET NULL,
   [End_DateTime]          DATETIMEOFFSET NULL,

   [Tenant_ID]             VARCHAR(30) NOT NULL,
   [Data_Owner_ID]         VARCHAR(30) NULL,
   [Agency_Reporting_ID]   VARCHAR(30) NULL,
   [Sequence_Number]       INTEGER NULL,
   [Version_Number]        VARCHAR(20),
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40),

   CONSTRAINT [PK_Immunization] PRIMARY KEY CLUSTERED ([Immunization_ID] ASC),
   CONSTRAINT [FK_Immunization_Activity] FOREIGN KEY ([Activity_ID]) 
      REFERENCES [Core].[Activity] ([Activity_ID]),
   CONSTRAINT [FK_Immunization_Organization] FOREIGN KEY ([Organization_ID]) 
      REFERENCES [Entity].[Organization] ([Organization_ID])
);


GO
CREATE NONCLUSTERED INDEX [IXFK_Immunization_Activity]
    ON [Healthcare].[Immunization]([Activity_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_Immunization_Immunization]
    ON [Healthcare].[Immunization]([Immunization_ID] ASC);


GO
CREATE NONCLUSTERED INDEX [IXFK_Immunization_Organization]
    ON [Healthcare].[Immunization]([Organization_ID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Manufacturer ID and Name from Organization Table as a lookup', @level0type = N'SCHEMA', @level0name = N'Healthcare', @level1type = N'TABLE', @level1name = N'Immunization', @level2type = N'COLUMN', @level2name = 'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'There are several types of vaccines, including: Inactivated vaccines. Live-attenuated vaccines. Messenger RNA (mRNA) vaccines.', @level0type = N'SCHEMA', @level0name = N'Healthcare', @level1type = N'TABLE', @level1name = N'Immunization', @level2type = N'COLUMN', @level2name = 'Immunization_Type_ID';

