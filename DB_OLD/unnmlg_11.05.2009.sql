SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CurrentTest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CurrentTest](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[test_variant_id] [int] NOT NULL,
 CONSTRAINT [PK_CurrentTest] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[History]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[discipline_part_id] [int] NOT NULL,
	[test_variant_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TestVariantQuestion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TestVariantQuestion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[test_variant_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
 CONSTRAINT [PK_TestVariantQuestion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Question]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[is_deleted] [tinyint] NOT NULL,
	[question_group_complexity_id] [int] NULL,
	[question_group_exclusion_id] [int] NULL,
	[question_group_double_id] [int] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HistoryAnswer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HistoryAnswer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[history_question_id] [int] NOT NULL,
	[answer_id] [int] NOT NULL,
 CONSTRAINT [PK_HistoryAnswer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Answer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Answer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question_id] [int] NOT NULL,
	[max_ball] [int] NOT NULL,
	[is_right] [tinyint] NOT NULL,
	[is_deleted] [tinyint] NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HistoryQuestion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HistoryQuestion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[history_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
 CONSTRAINT [PK_HistoryQuestion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TestVariant]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TestVariant](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[is_deleted] [tinyint] NOT NULL,
	[discipline_part_id] [int] NOT NULL,
	[path] [text] NOT NULL,
 CONSTRAINT [PK_TestVariant] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuestionGroupExclusion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QuestionGroupExclusion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[discipline_part_id] [int] NOT NULL,
	[title] [varchar](255) NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_QuestionGroupExclusion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuestionGroupDouble]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QuestionGroupDouble](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[discipline_part_id] [int] NOT NULL,
	[title] [varchar](255) NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_QuestionGroupDouble] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuestionGroupComplexity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QuestionGroupComplexity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[discipline_part_id] [int] NOT NULL,
	[title] [varchar](255) NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_QuestionGroupComplexity] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisciplinePart]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DisciplinePart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[discipline_id] [int] NOT NULL,
 CONSTRAINT [PK_DisciplinePart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Discipline]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Discipline](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[chair_id] [int] NOT NULL,
	[department_id] [int] NOT NULL,
	[title] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Discipline] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
BEGIN


CREATE TABLE [dbo].[Student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[email] [varchar](255) NOT NULL,
	[login] [varchar](64) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Chair]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Chair](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[department_id] [int] NOT NULL,
	[title] [varchar](255) NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_Chair] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Group]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[department_id] [int] NOT NULL,
	[title] [varchar](255) NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CurrentTest_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[CurrentTest]'))
ALTER TABLE [dbo].[CurrentTest]  WITH CHECK ADD  CONSTRAINT [FK_CurrentTest_Student] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student] ([id])
GO
ALTER TABLE [dbo].[CurrentTest] CHECK CONSTRAINT [FK_CurrentTest_Student]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CurrentTest_TestVariant]') AND parent_object_id = OBJECT_ID(N'[dbo].[CurrentTest]'))
ALTER TABLE [dbo].[CurrentTest]  WITH CHECK ADD  CONSTRAINT [FK_CurrentTest_TestVariant] FOREIGN KEY([test_variant_id])
REFERENCES [dbo].[TestVariant] ([id])
GO
ALTER TABLE [dbo].[CurrentTest] CHECK CONSTRAINT [FK_CurrentTest_TestVariant]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_History_DisciplinePart]') AND parent_object_id = OBJECT_ID(N'[dbo].[History]'))
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_DisciplinePart] FOREIGN KEY([discipline_part_id])
REFERENCES [dbo].[DisciplinePart] ([id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_DisciplinePart]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_History_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[History]'))
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Student] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student] ([id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Student]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_History_TestVariant]') AND parent_object_id = OBJECT_ID(N'[dbo].[History]'))
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_TestVariant] FOREIGN KEY([test_variant_id])
REFERENCES [dbo].[TestVariant] ([id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_TestVariant]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TestVariantQuestion_Question]') AND parent_object_id = OBJECT_ID(N'[dbo].[TestVariantQuestion]'))
ALTER TABLE [dbo].[TestVariantQuestion]  WITH CHECK ADD  CONSTRAINT [FK_TestVariantQuestion_Question] FOREIGN KEY([question_id])
REFERENCES [dbo].[Question] ([id])
GO
ALTER TABLE [dbo].[TestVariantQuestion] CHECK CONSTRAINT [FK_TestVariantQuestion_Question]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TestVariantQuestion_TestVariant]') AND parent_object_id = OBJECT_ID(N'[dbo].[TestVariantQuestion]'))
ALTER TABLE [dbo].[TestVariantQuestion]  WITH CHECK ADD  CONSTRAINT [FK_TestVariantQuestion_TestVariant] FOREIGN KEY([test_variant_id])
REFERENCES [dbo].[TestVariant] ([id])
GO
ALTER TABLE [dbo].[TestVariantQuestion] CHECK CONSTRAINT [FK_TestVariantQuestion_TestVariant]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Question_Question]') AND parent_object_id = OBJECT_ID(N'[dbo].[Question]'))
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Question] FOREIGN KEY([question_group_complexity_id])
REFERENCES [dbo].[QuestionGroupComplexity] ([id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Question]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Question_QuestionGroupDouble]') AND parent_object_id = OBJECT_ID(N'[dbo].[Question]'))
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_QuestionGroupDouble] FOREIGN KEY([question_group_double_id])
REFERENCES [dbo].[QuestionGroupDouble] ([id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_QuestionGroupDouble]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Question_QuestionGroupExclusion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Question]'))
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_QuestionGroupExclusion] FOREIGN KEY([question_group_exclusion_id])
REFERENCES [dbo].[QuestionGroupExclusion] ([id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_QuestionGroupExclusion]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoryAnswer_Answer]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoryAnswer]'))
ALTER TABLE [dbo].[HistoryAnswer]  WITH CHECK ADD  CONSTRAINT [FK_HistoryAnswer_Answer] FOREIGN KEY([answer_id])
REFERENCES [dbo].[Answer] ([id])
GO
ALTER TABLE [dbo].[HistoryAnswer] CHECK CONSTRAINT [FK_HistoryAnswer_Answer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoryAnswer_HistoryQuestion]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoryAnswer]'))
ALTER TABLE [dbo].[HistoryAnswer]  WITH CHECK ADD  CONSTRAINT [FK_HistoryAnswer_HistoryQuestion] FOREIGN KEY([history_question_id])
REFERENCES [dbo].[HistoryQuestion] ([id])
GO
ALTER TABLE [dbo].[HistoryAnswer] CHECK CONSTRAINT [FK_HistoryAnswer_HistoryQuestion]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Answer_Question]') AND parent_object_id = OBJECT_ID(N'[dbo].[Answer]'))
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([question_id])
REFERENCES [dbo].[Question] ([id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoryQuestion_History]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoryQuestion]'))
ALTER TABLE [dbo].[HistoryQuestion]  WITH CHECK ADD  CONSTRAINT [FK_HistoryQuestion_History] FOREIGN KEY([history_id])
REFERENCES [dbo].[History] ([id])
GO
ALTER TABLE [dbo].[HistoryQuestion] CHECK CONSTRAINT [FK_HistoryQuestion_History]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoryQuestion_Question]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoryQuestion]'))
ALTER TABLE [dbo].[HistoryQuestion]  WITH CHECK ADD  CONSTRAINT [FK_HistoryQuestion_Question] FOREIGN KEY([question_id])
REFERENCES [dbo].[Question] ([id])
GO
ALTER TABLE [dbo].[HistoryQuestion] CHECK CONSTRAINT [FK_HistoryQuestion_Question]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TestVariant_DisciplinePart]') AND parent_object_id = OBJECT_ID(N'[dbo].[TestVariant]'))
ALTER TABLE [dbo].[TestVariant]  WITH CHECK ADD  CONSTRAINT [FK_TestVariant_DisciplinePart] FOREIGN KEY([discipline_part_id])
REFERENCES [dbo].[DisciplinePart] ([id])
GO
ALTER TABLE [dbo].[TestVariant] CHECK CONSTRAINT [FK_TestVariant_DisciplinePart]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QuestionGroupExclusion_DisciplinePart]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuestionGroupExclusion]'))
ALTER TABLE [dbo].[QuestionGroupExclusion]  WITH CHECK ADD  CONSTRAINT [FK_QuestionGroupExclusion_DisciplinePart] FOREIGN KEY([discipline_part_id])
REFERENCES [dbo].[DisciplinePart] ([id])
GO
ALTER TABLE [dbo].[QuestionGroupExclusion] CHECK CONSTRAINT [FK_QuestionGroupExclusion_DisciplinePart]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QuestionGroupDouble_DisciplinePart]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuestionGroupDouble]'))
ALTER TABLE [dbo].[QuestionGroupDouble]  WITH CHECK ADD  CONSTRAINT [FK_QuestionGroupDouble_DisciplinePart] FOREIGN KEY([discipline_part_id])
REFERENCES [dbo].[DisciplinePart] ([id])
GO
ALTER TABLE [dbo].[QuestionGroupDouble] CHECK CONSTRAINT [FK_QuestionGroupDouble_DisciplinePart]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_QuestionGroupComplexity_DisciplinePart]') AND parent_object_id = OBJECT_ID(N'[dbo].[QuestionGroupComplexity]'))
ALTER TABLE [dbo].[QuestionGroupComplexity]  WITH CHECK ADD  CONSTRAINT [FK_QuestionGroupComplexity_DisciplinePart] FOREIGN KEY([discipline_part_id])
REFERENCES [dbo].[DisciplinePart] ([id])
GO
ALTER TABLE [dbo].[QuestionGroupComplexity] CHECK CONSTRAINT [FK_QuestionGroupComplexity_DisciplinePart]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DisciplinePart_Discipline]') AND parent_object_id = OBJECT_ID(N'[dbo].[DisciplinePart]'))
ALTER TABLE [dbo].[DisciplinePart]  WITH CHECK ADD  CONSTRAINT [FK_DisciplinePart_Discipline] FOREIGN KEY([discipline_id])
REFERENCES [dbo].[Discipline] ([id])
GO
ALTER TABLE [dbo].[DisciplinePart] CHECK CONSTRAINT [FK_DisciplinePart_Discipline]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Discipline_Chair]') AND parent_object_id = OBJECT_ID(N'[dbo].[Discipline]'))
ALTER TABLE [dbo].[Discipline]  WITH CHECK ADD  CONSTRAINT [FK_Discipline_Chair] FOREIGN KEY([chair_id])
REFERENCES [dbo].[Chair] ([id])
GO
ALTER TABLE [dbo].[Discipline] CHECK CONSTRAINT [FK_Discipline_Chair]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Discipline_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Discipline]'))
ALTER TABLE [dbo].[Discipline]  WITH CHECK ADD  CONSTRAINT [FK_Discipline_Department] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([id])
GO
ALTER TABLE [dbo].[Discipline] CHECK CONSTRAINT [FK_Discipline_Department]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group] FOREIGN KEY([group_id])
REFERENCES [dbo].[Group] ([id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Group]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Chair_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Chair]'))
ALTER TABLE [dbo].[Chair]  WITH CHECK ADD  CONSTRAINT [FK_Chair_Department] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([id])
GO
ALTER TABLE [dbo].[Chair] CHECK CONSTRAINT [FK_Chair_Department]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Group_Department]') AND parent_object_id = OBJECT_ID(N'[dbo].[Group]'))
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Department] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Department]
GO
