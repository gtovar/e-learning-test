USE [mlg_pus]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 08/14/2008 20:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Question_ID] [bigint] NOT NULL,
	[Definintion] [ntext] COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CurrentTest]    Script Date: 08/14/2008 20:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrentTest](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Student_ID] [bigint] NOT NULL,
	[TestVariant_ID] [bigint] NOT NULL,
 CONSTRAINT [PK_CurrentTest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discipline]    Script Date: 08/14/2008 20:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discipline](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](255) COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Discipline] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DisciplinePart]    Script Date: 08/14/2008 20:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisciplinePart](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](255) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Discipline_ID] [bigint] NOT NULL,
 CONSTRAINT [PK_DisciplinePart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group]    Script Date: 08/14/2008 20:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](255) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Definition] [ntext] COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[History]    Script Date: 08/14/2008 20:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Student_ID] [bigint] NOT NULL,
	[DisciplinePart_ID] [bigint] NOT NULL,
	[TestVariant] [bigint] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HistoryAnswer]    Script Date: 08/14/2008 20:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryAnswer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[HistoryQuestion_ID] [bigint] NOT NULL,
	[Answer_ID] [bigint] NOT NULL,
 CONSTRAINT [PK_HistoryAnswer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HistoryQuestion]    Script Date: 08/14/2008 20:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryQuestion](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[History_ID] [bigint] NOT NULL,
	[Question_ID] [bigint] NOT NULL,
 CONSTRAINT [PK_HistoryQuestion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question]    Script Date: 08/14/2008 20:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](255) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Definition] [ntext] COLLATE Cyrillic_General_CI_AS NOT NULL,
	[QuestionGroupComplexity_ID] [bigint] NULL,
	[QuestionGroupExclusion_ID] [bigint] NULL,
	[QuestionGroupDouble_ID] [bigint] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionGroupComplexity]    Script Date: 08/14/2008 20:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionGroupComplexity](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DisciplinePart_ID] [bigint] NOT NULL,
	[Name] [nchar](255) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Definition] [ntext] COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_QuestionGroupComplexity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionGroupDouble]    Script Date: 08/14/2008 20:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionGroupDouble](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DisciplinePart_ID] [bigint] NOT NULL,
	[Name] [nchar](255) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Definition] [ntext] COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_QuestionGroupDouble] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionGroupExclusion]    Script Date: 08/14/2008 20:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionGroupExclusion](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[DisciplinePart_ID] [bigint] NOT NULL,
	[Name] [nchar](255) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Definition] [ntext] COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_QuestionGroupExclusion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 08/14/2008 20:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Group_ID] [bigint] NOT NULL,
	[Name] [nchar](255) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Definition] [ntext] COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestVariant]    Script Date: 08/14/2008 20:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestVariant](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Discipline_ID] [bigint] NOT NULL,
	[Part_ID] [bigint] NOT NULL,
	[Path] [ntext] COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_TestVariant] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestVariantQuestion]    Script Date: 08/14/2008 20:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestVariantQuestion](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TestVariant_ID] [bigint] NOT NULL,
	[Question_ID] [bigint] NOT NULL,
 CONSTRAINT [PK_TestVariantQuestion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Question] ([ID])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[CurrentTest]  WITH CHECK ADD  CONSTRAINT [FK_CurrentTest_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[CurrentTest] CHECK CONSTRAINT [FK_CurrentTest_Student]
GO
ALTER TABLE [dbo].[CurrentTest]  WITH CHECK ADD  CONSTRAINT [FK_CurrentTest_TestVariant] FOREIGN KEY([TestVariant_ID])
REFERENCES [dbo].[TestVariant] ([ID])
GO
ALTER TABLE [dbo].[CurrentTest] CHECK CONSTRAINT [FK_CurrentTest_TestVariant]
GO
ALTER TABLE [dbo].[Discipline]  WITH CHECK ADD  CONSTRAINT [FK_Discipline_Discipline] FOREIGN KEY([ID])
REFERENCES [dbo].[Discipline] ([ID])
GO
ALTER TABLE [dbo].[Discipline] CHECK CONSTRAINT [FK_Discipline_Discipline]
GO
ALTER TABLE [dbo].[DisciplinePart]  WITH CHECK ADD  CONSTRAINT [FK_DisciplinePart_Discipline] FOREIGN KEY([Discipline_ID])
REFERENCES [dbo].[Discipline] ([ID])
GO
ALTER TABLE [dbo].[DisciplinePart] CHECK CONSTRAINT [FK_DisciplinePart_Discipline]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_DisciplinePart] FOREIGN KEY([DisciplinePart_ID])
REFERENCES [dbo].[DisciplinePart] ([ID])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_DisciplinePart]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Student]
GO
ALTER TABLE [dbo].[HistoryAnswer]  WITH CHECK ADD  CONSTRAINT [FK_HistoryAnswer_Answer] FOREIGN KEY([Answer_ID])
REFERENCES [dbo].[Answer] ([ID])
GO
ALTER TABLE [dbo].[HistoryAnswer] CHECK CONSTRAINT [FK_HistoryAnswer_Answer]
GO
ALTER TABLE [dbo].[HistoryAnswer]  WITH CHECK ADD  CONSTRAINT [FK_HistoryAnswer_HistoryQuestion] FOREIGN KEY([HistoryQuestion_ID])
REFERENCES [dbo].[HistoryQuestion] ([ID])
GO
ALTER TABLE [dbo].[HistoryAnswer] CHECK CONSTRAINT [FK_HistoryAnswer_HistoryQuestion]
GO
ALTER TABLE [dbo].[HistoryQuestion]  WITH CHECK ADD  CONSTRAINT [FK_HistoryQuestion_History] FOREIGN KEY([History_ID])
REFERENCES [dbo].[History] ([ID])
GO
ALTER TABLE [dbo].[HistoryQuestion] CHECK CONSTRAINT [FK_HistoryQuestion_History]
GO
ALTER TABLE [dbo].[HistoryQuestion]  WITH CHECK ADD  CONSTRAINT [FK_HistoryQuestion_Question] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Question] ([ID])
GO
ALTER TABLE [dbo].[HistoryQuestion] CHECK CONSTRAINT [FK_HistoryQuestion_Question]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Question] FOREIGN KEY([QuestionGroupComplexity_ID])
REFERENCES [dbo].[QuestionGroupComplexity] ([ID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Question]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_QuestionGroupDouble] FOREIGN KEY([QuestionGroupDouble_ID])
REFERENCES [dbo].[QuestionGroupDouble] ([ID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_QuestionGroupDouble]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_QuestionGroupExclusion] FOREIGN KEY([QuestionGroupExclusion_ID])
REFERENCES [dbo].[QuestionGroupExclusion] ([ID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_QuestionGroupExclusion]
GO
ALTER TABLE [dbo].[QuestionGroupComplexity]  WITH CHECK ADD  CONSTRAINT [FK_QuestionGroupComplexity_DisciplinePart] FOREIGN KEY([DisciplinePart_ID])
REFERENCES [dbo].[DisciplinePart] ([ID])
GO
ALTER TABLE [dbo].[QuestionGroupComplexity] CHECK CONSTRAINT [FK_QuestionGroupComplexity_DisciplinePart]
GO
ALTER TABLE [dbo].[QuestionGroupDouble]  WITH CHECK ADD  CONSTRAINT [FK_QuestionGroupDouble_DisciplinePart] FOREIGN KEY([DisciplinePart_ID])
REFERENCES [dbo].[DisciplinePart] ([ID])
GO
ALTER TABLE [dbo].[QuestionGroupDouble] CHECK CONSTRAINT [FK_QuestionGroupDouble_DisciplinePart]
GO
ALTER TABLE [dbo].[QuestionGroupExclusion]  WITH CHECK ADD  CONSTRAINT [FK_QuestionGroupExclusion_DisciplinePart] FOREIGN KEY([DisciplinePart_ID])
REFERENCES [dbo].[DisciplinePart] ([ID])
GO
ALTER TABLE [dbo].[QuestionGroupExclusion] CHECK CONSTRAINT [FK_QuestionGroupExclusion_DisciplinePart]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group] FOREIGN KEY([Group_ID])
REFERENCES [dbo].[Group] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Group]
GO
ALTER TABLE [dbo].[TestVariantQuestion]  WITH CHECK ADD  CONSTRAINT [FK_TestVariantQuestion_Question] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Question] ([ID])
GO
ALTER TABLE [dbo].[TestVariantQuestion] CHECK CONSTRAINT [FK_TestVariantQuestion_Question]
GO
ALTER TABLE [dbo].[TestVariantQuestion]  WITH CHECK ADD  CONSTRAINT [FK_TestVariantQuestion_TestVariant] FOREIGN KEY([TestVariant_ID])
REFERENCES [dbo].[TestVariant] ([ID])
GO
ALTER TABLE [dbo].[TestVariantQuestion] CHECK CONSTRAINT [FK_TestVariantQuestion_TestVariant]