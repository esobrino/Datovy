CREATE TABLE [Entity].[Person] (
   [Person_ID]                       VARCHAR(40)  NOT NULL,
   [Alternate_ID]                    VARCHAR(40)  NULL,
   [Type_ID]                         VARCHAR(30)  NULL,

   [Birth_DateTime]                  DATETIMEOFFSET NULL,
   [Birth_Date]                      DATE NULL,
   [Birth_Date_Text]                 VARCHAR(50)  NULL,
   [Birth_Location_ID]               VARCHAR(30)  NULL,

   [Name_Type_ID]                    VARCHAR(30)  NULL,
   [Name_Given]                      VARCHAR(80)  NULL,
   [Name_Middle]                     VARCHAR(80)  NULL,
   [Name_Family]                     VARCHAR(80)  NULL,
   [Name_Prefix_Code_ID]             VARCHAR(30)  NULL,
   [Name_Suffix_Code_ID]             VARCHAR(30)  NULL,
   [Name_Full]                       VARCHAR(128) NULL,

   [Sex_Birth_Code_ID]               VARCHAR(30)  NULL,
   [Sex_Code_ID]                     VARCHAR(30)  NULL,
   [Gender_Identity_Code_ID]         VARCHAR(30)  NULL,
   [Sexual_Orientation_Code_ID]      VARCHAR(30)  NULL,
   [Height]                          INT          NULL,
   [Height_Unit_Code]                VARCHAR(30)  NULL,
   [Weight]                          INT          NULL,
   [Weight_Unit_Code]                VARCHAR(30)  NULL,
   [Ethnicity_Code_ID]               VARCHAR(30)  NULL,
   [Race_Code_ID]                    VARCHAR(30)  NULL,
   [Language_Primary_ID]             VARCHAR(30)  NULL,
   [Language_Secondary_ID]           VARCHAR(30)  NULL,
   [Education_Level_Highest_Code_ID] VARCHAR(30)  NULL,

   [Status_Code_ID]                  VARCHAR(30)  NULL,
   [Status_DateTime]                 DATETIMEOFFSET NULL,

   -- record management
   [Tenant_ID]             VARCHAR(40) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]         VARCHAR(40) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]   VARCHAR(40) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_Last_DateTime] DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Person] PRIMARY KEY CLUSTERED ([Person_ID] ASC),
   CONSTRAINT [fk_Person_Type] FOREIGN KEY ([Type_ID]) 
      REFERENCES [Entity].[Person_Type] ([Type_ID]),
   CONSTRAINT [fk_Person_Name_Type] FOREIGN KEY ([Name_Type_ID])
      REFERENCES [Entity].[Name_Type] ([Type_ID]),

   CONSTRAINT [fk_Person_Ethnicity_Code] FOREIGN KEY ([Ethnicity_Code_ID])
      REFERENCES [Entity].[Ethnicity_Code] ([Code_ID]),
   CONSTRAINT [fk_Person_Race_Code] FOREIGN KEY ([Race_Code_ID])
      REFERENCES [Entity].[Race_Code] ([Code_ID]),

   CONSTRAINT [fk_Person_Sex_Code] FOREIGN KEY ([Sex_Code_ID])
      REFERENCES [Entity].[Sex_Code] ([Code_ID]),
   CONSTRAINT [fk_Person_Gender_Identity_Code] FOREIGN KEY ([Gender_Identity_Code_ID])
      REFERENCES [Entity].[Gender_Identity_Code] ([Code_ID]),
   CONSTRAINT [fk_Person_Sexual_Orientation_Code] FOREIGN KEY ([Sexual_Orientation_Code_ID])
      REFERENCES [Entity].[Sexual_Orientation_Code] ([Code_ID])
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'Birth Location ID is a reference to a location detailed elsewhere', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Person',
   @level2type = N'COLUMN',   @level2name = 'Birth_Location_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Sex at Birth: Male, Female, Other, Unknown', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Person',
   @level2type = N'COLUMN',   @level2name = 'Sex_Birth_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Current Sex Code: Male, Female, Other, Unknown', 
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Person', 
   @level2type = N'COLUMN',   @level2name = 'Sex_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'The person identifies the Identity as', 
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Person',
   @level2type = N'COLUMN',   @level2name = 'Gender_Identity_Code_ID';
GO
