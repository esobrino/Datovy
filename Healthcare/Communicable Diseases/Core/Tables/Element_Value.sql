-- Element Items are the information provided by the user for a particular 
-- element in the group or list.  It could be a range of dates (start - end), a
-- start and end numeric value, a value as a text item, a just a check-mark or
-- other.
--
-- * The Element-ID points to the element template details, like the text to be
--   displayed (see Label_Text).
-- * The Type is used to know what UI item to present and what to expect.
-- * The Order identify the position of the item in the group or list.
CREATE TABLE [Core].[Element_Value]
(
   [Element_Value_ID]      VARCHAR(30) NOT NULL,

   [Element_ID]            VARCHAR(30) NOT NULL,
   [Type_ID]               VARCHAR(30) NOT NULL,
   [Sequence_No]           INT NULL,

   -- item values
   [Checked]               BIT,
   [Start_Date]            DATE,
   [End_Date]              DATE,
   [Start_Value]           DECIMAL,
   [End_Value]             DECIMAL,
   [Value_Text]            VARCHAR(128),

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

   CONSTRAINT [pk_Element_Value] PRIMARY KEY CLUSTERED ([Element_Value_ID] ASC),
   CONSTRAINT [fk_Element_Value_Element] FOREIGN KEY ([Element_ID])
      REFERENCES [Core].[Element] ([Element_ID]),
   CONSTRAINT [fk_Element_Value_ID] FOREIGN KEY ([Type_ID])
      REFERENCES [Core].[Element_Value_Type] ([Type_ID])
)
