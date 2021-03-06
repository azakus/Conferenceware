USE [Conferenceware]
GO
/****** Object:  Table [dbo].[People]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[phone_number] [nchar](12) NOT NULL,
	[is_alum] [bit] NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[page_content] [text] NOT NULL,
	[parent_id] [int] NOT NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [Unique_Title_Pages] UNIQUE NONCLUSTERED 
(
	[title] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TShirtSizes]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TShirtSizes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_TShirtSizes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlots]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlots](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
 CONSTRAINT [PK_TimeSlots] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[max_capacity] [int] NOT NULL,
	[building_name] [nvarchar](255) NOT NULL,
	[room_number] [nvarchar](255) NOT NULL,
	[notes] [ntext] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foods]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Foods] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 04/02/2010 14:54:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Companies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[address_line1] [nvarchar](255) NOT NULL,
	[address_line2] [nvarchar](255) NOT NULL,
	[city] [nvarchar](255) NOT NULL,
	[state] [char](2) NOT NULL,
	[zip] [char](5) NOT NULL,
	[needs_power] [bit] NOT NULL,
	[priority_shipping] [bit] NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Attendees]    Script Date: 04/02/2010 14:54:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendees](
	[person_id] [int] NOT NULL,
	[food_choice_id] [int] NOT NULL,
	[tshirt_id] [int] NOT NULL,
 CONSTRAINT [PK_Attendees] PRIMARY KEY CLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Trigger [DeleteClean]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jim Wordelman
-- Create date: 2010-03-10
-- Description:	Trigger for keeping integrity of pages on delete
-- =============================================
CREATE TRIGGER [dbo].[DeleteClean] 
   ON  [dbo].[Pages] 
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- loops are slow, but this is more readable and is based on the assumption
	-- that you have a small dataset. in actuality, this loop will probably
	-- only execute once making performance just fine
	DECLARE @parent_id int, @grandparent_id int
	
	DECLARE result_cursor CURSOR FOR
	SELECT id,parent_id FROM deleted
	
	OPEN result_cursor
	
	FETCH NEXT FROM result_cursor
	INTO @parent_id,@grandparent_id
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE Pages
		SET parent_id = @grandparent_id
		WHERE parent_id = @parent_id;
		
		FETCH NEXT FROM result_cursor
		INTO @parent_id,@grandparent_id
	END
	
	CLOSE result_cursor
	DEALLOCATE result_cursor

END
GO
/****** Object:  Table [dbo].[CompanyPeople]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyPeople](
	[person_id] [int] NOT NULL,
	[company_id] [int] NOT NULL,
	[is_contact] [bit] NOT NULL,
	[is_attending] [bit] NOT NULL,
 CONSTRAINT [PK_CompanyPeople] PRIMARY KEY CLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyPayments]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyPayments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[received_date] [date] NOT NULL,
	[amount] [money] NOT NULL,
	[comments] [text] NOT NULL,
 CONSTRAINT [PK_CompanyPayments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyInvoices]    Script Date: 04/02/2010 14:54:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyInvoices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[created] [datetime] NOT NULL,
	[last_sent] [datetime] NOT NULL,
	[paid] [bit] NOT NULL,
	[marked_paid_date] [datetime] NOT NULL,
 CONSTRAINT [PK_CompanyInvoices] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [ntext] NOT NULL,
	[max_attendees] [int] NOT NULL,
	[timeslot_id] [int] NOT NULL,
	[location_id] [int] NOT NULL,
	[is_visible] [bit] NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffMembers]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffMembers](
	[person_id] [int] NOT NULL,
	[auth_name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_StaffMembers] PRIMARY KEY CLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speakers]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speakers](
	[person_id] [int] NOT NULL,
 CONSTRAINT [PK_Speakers] PRIMARY KEY CLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volunteers]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteers](
	[person_id] [int] NOT NULL,
	[is_video_trained] [bit] NOT NULL,
 CONSTRAINT [PK_Volunteers] PRIMARY KEY CLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VolunteerTimeSlots]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VolunteerTimeSlots](
	[timeslot_id] [int] NOT NULL,
	[is_video] [bit] NOT NULL,
 CONSTRAINT [PK_VolunteerTimeSlots_1] PRIMARY KEY CLUSTERED 
(
	[timeslot_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VolunteersVolunteerTimeSlots]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VolunteersVolunteerTimeSlots](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[volunteer_timeslot_id] [int] NOT NULL,
	[volunteer_id] [int] NOT NULL,
	[is_scheduled] [bit] NOT NULL,
	[is_confirmed] [bit] NOT NULL,
 CONSTRAINT [PK_VolunteersVolunteerTimeSlots] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MechManiaTeams]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MechManiaTeams](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[team_name] [nvarchar](255) NOT NULL,
	[member1_id] [int] NOT NULL,
	[member2_id] [int] NOT NULL,
	[member3_id] [int] NOT NULL,
	[account_name] [varchar](255) NOT NULL,
	[account_password] [varchar](255) NOT NULL,
 CONSTRAINT [PK_MechManiaTeams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EventsSpeakers]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventsSpeakers](
	[event_id] [int] NOT NULL,
	[speaker_id] [int] NOT NULL,
 CONSTRAINT [PK_EventsSpeakers] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC,
	[speaker_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventsAttendees]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventsAttendees](
	[event_id] [int] NOT NULL,
	[attendee_id] [int] NOT NULL,
 CONSTRAINT [PK_EventsAttendees] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC,
	[attendee_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventContentLinks]    Script Date: 04/02/2010 14:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventContentLinks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[event_id] [int] NOT NULL,
	[link_location] [nvarchar](255) NOT NULL,
	[list_on_video_page] [bit] NOT NULL,
 CONSTRAINT [PK_EventContentLinks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyInvoiceItems]    Script Date: 04/02/2010 14:54:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyInvoiceItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[invoice_id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [text] NOT NULL,
	[cost] [money] NOT NULL,
 CONSTRAINT [PK_CompanyInvoiceItems] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Default [DF_Companies_needs_power]    Script Date: 04/02/2010 14:54:56 ******/
ALTER TABLE [dbo].[Companies] ADD  CONSTRAINT [DF_Companies_needs_power]  DEFAULT ((0)) FOR [needs_power]
GO
/****** Object:  Default [DF_Companies_priority_shipping]    Script Date: 04/02/2010 14:54:56 ******/
ALTER TABLE [dbo].[Companies] ADD  CONSTRAINT [DF_Companies_priority_shipping]  DEFAULT ((0)) FOR [priority_shipping]
GO
/****** Object:  Default [DF_CompanyInvoices_paid]    Script Date: 04/02/2010 14:54:56 ******/
ALTER TABLE [dbo].[CompanyInvoices] ADD  CONSTRAINT [DF_CompanyInvoices_paid]  DEFAULT ((0)) FOR [paid]
GO
/****** Object:  Default [DF_CompanyPeople_is_contact]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[CompanyPeople] ADD  CONSTRAINT [DF_CompanyPeople_is_contact]  DEFAULT ((0)) FOR [is_contact]
GO
/****** Object:  Default [DF_CompanyPeople_is_attending]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[CompanyPeople] ADD  CONSTRAINT [DF_CompanyPeople_is_attending]  DEFAULT ((0)) FOR [is_attending]
GO
/****** Object:  Default [DF_EventContentLinks_list_on_video_page]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[EventContentLinks] ADD  CONSTRAINT [DF_EventContentLinks_list_on_video_page]  DEFAULT ((0)) FOR [list_on_video_page]
GO
/****** Object:  Default [DF_Events_is_visible]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF_Events_is_visible]  DEFAULT ((1)) FOR [is_visible]
GO
/****** Object:  Default [DF_Pages_parent_id]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[Pages] ADD  CONSTRAINT [DF_Pages_parent_id]  DEFAULT ((0)) FOR [parent_id]
GO
/****** Object:  Default [DF_People_is_alum]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[People] ADD  CONSTRAINT [DF_People_is_alum]  DEFAULT ((0)) FOR [is_alum]
GO
/****** Object:  Default [DF_VolunteersVolunteerTimeSlots_is_scheduled]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[VolunteersVolunteerTimeSlots] ADD  CONSTRAINT [DF_VolunteersVolunteerTimeSlots_is_scheduled]  DEFAULT ((0)) FOR [is_scheduled]
GO
/****** Object:  Default [DF_VolunteersVolunteerTimeSlots_is_confirmed]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[VolunteersVolunteerTimeSlots] ADD  CONSTRAINT [DF_VolunteersVolunteerTimeSlots_is_confirmed]  DEFAULT ((0)) FOR [is_confirmed]
GO
/****** Object:  Default [DF_VolunteerTimeSlots_is_video]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[VolunteerTimeSlots] ADD  CONSTRAINT [DF_VolunteerTimeSlots_is_video]  DEFAULT ((0)) FOR [is_video]
GO
/****** Object:  ForeignKey [FK_Foods_Attendees]    Script Date: 04/02/2010 14:54:56 ******/
ALTER TABLE [dbo].[Attendees]  WITH CHECK ADD  CONSTRAINT [FK_Foods_Attendees] FOREIGN KEY([food_choice_id])
REFERENCES [dbo].[Foods] ([id])
GO
ALTER TABLE [dbo].[Attendees] CHECK CONSTRAINT [FK_Foods_Attendees]
GO
/****** Object:  ForeignKey [FK_People_Attendees]    Script Date: 04/02/2010 14:54:56 ******/
ALTER TABLE [dbo].[Attendees]  WITH CHECK ADD  CONSTRAINT [FK_People_Attendees] FOREIGN KEY([person_id])
REFERENCES [dbo].[People] ([id])
GO
ALTER TABLE [dbo].[Attendees] CHECK CONSTRAINT [FK_People_Attendees]
GO
/****** Object:  ForeignKey [FK_TShirts_Attendees]    Script Date: 04/02/2010 14:54:56 ******/
ALTER TABLE [dbo].[Attendees]  WITH CHECK ADD  CONSTRAINT [FK_TShirts_Attendees] FOREIGN KEY([tshirt_id])
REFERENCES [dbo].[TShirtSizes] ([id])
GO
ALTER TABLE [dbo].[Attendees] CHECK CONSTRAINT [FK_TShirts_Attendees]
GO
/****** Object:  ForeignKey [FK_CompanyInvoiceItems_CompanyInvoices]    Script Date: 04/02/2010 14:54:56 ******/
ALTER TABLE [dbo].[CompanyInvoiceItems]  WITH CHECK ADD  CONSTRAINT [FK_CompanyInvoiceItems_CompanyInvoices] FOREIGN KEY([invoice_id])
REFERENCES [dbo].[CompanyInvoices] ([id])
GO
ALTER TABLE [dbo].[CompanyInvoiceItems] CHECK CONSTRAINT [FK_CompanyInvoiceItems_CompanyInvoices]
GO
/****** Object:  ForeignKey [FK_CompanyInvoices_Companies]    Script Date: 04/02/2010 14:54:56 ******/
ALTER TABLE [dbo].[CompanyInvoices]  WITH CHECK ADD  CONSTRAINT [FK_CompanyInvoices_Companies] FOREIGN KEY([company_id])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[CompanyInvoices] CHECK CONSTRAINT [FK_CompanyInvoices_Companies]
GO
/****** Object:  ForeignKey [FK_CompanyPayments_Companies]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[CompanyPayments]  WITH CHECK ADD  CONSTRAINT [FK_CompanyPayments_Companies] FOREIGN KEY([company_id])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[CompanyPayments] CHECK CONSTRAINT [FK_CompanyPayments_Companies]
GO
/****** Object:  ForeignKey [FK_CompanyPeople_Companies]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[CompanyPeople]  WITH CHECK ADD  CONSTRAINT [FK_CompanyPeople_Companies] FOREIGN KEY([company_id])
REFERENCES [dbo].[Companies] ([id])
GO
ALTER TABLE [dbo].[CompanyPeople] CHECK CONSTRAINT [FK_CompanyPeople_Companies]
GO
/****** Object:  ForeignKey [FK_CompanyPeople_People]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[CompanyPeople]  WITH CHECK ADD  CONSTRAINT [FK_CompanyPeople_People] FOREIGN KEY([person_id])
REFERENCES [dbo].[People] ([id])
GO
ALTER TABLE [dbo].[CompanyPeople] CHECK CONSTRAINT [FK_CompanyPeople_People]
GO
/****** Object:  ForeignKey [FK_EventContentLinks_Events]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[EventContentLinks]  WITH CHECK ADD  CONSTRAINT [FK_EventContentLinks_Events] FOREIGN KEY([event_id])
REFERENCES [dbo].[Events] ([id])
GO
ALTER TABLE [dbo].[EventContentLinks] CHECK CONSTRAINT [FK_EventContentLinks_Events]
GO
/****** Object:  ForeignKey [FK_Locations_Events]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Events] FOREIGN KEY([location_id])
REFERENCES [dbo].[Locations] ([id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Locations_Events]
GO
/****** Object:  ForeignKey [FK_TimeSlots_Events]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_TimeSlots_Events] FOREIGN KEY([timeslot_id])
REFERENCES [dbo].[TimeSlots] ([id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_TimeSlots_Events]
GO
/****** Object:  ForeignKey [FK_Attendees_EventsAttendees]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[EventsAttendees]  WITH CHECK ADD  CONSTRAINT [FK_Attendees_EventsAttendees] FOREIGN KEY([attendee_id])
REFERENCES [dbo].[Attendees] ([person_id])
GO
ALTER TABLE [dbo].[EventsAttendees] CHECK CONSTRAINT [FK_Attendees_EventsAttendees]
GO
/****** Object:  ForeignKey [FK_Events_EventsAttendees]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[EventsAttendees]  WITH CHECK ADD  CONSTRAINT [FK_Events_EventsAttendees] FOREIGN KEY([event_id])
REFERENCES [dbo].[Events] ([id])
GO
ALTER TABLE [dbo].[EventsAttendees] CHECK CONSTRAINT [FK_Events_EventsAttendees]
GO
/****** Object:  ForeignKey [FK_Events_EventsSpeakers]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[EventsSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_Events_EventsSpeakers] FOREIGN KEY([event_id])
REFERENCES [dbo].[Events] ([id])
GO
ALTER TABLE [dbo].[EventsSpeakers] CHECK CONSTRAINT [FK_Events_EventsSpeakers]
GO
/****** Object:  ForeignKey [FK_Speakers_EventsSpeakers]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[EventsSpeakers]  WITH CHECK ADD  CONSTRAINT [FK_Speakers_EventsSpeakers] FOREIGN KEY([speaker_id])
REFERENCES [dbo].[Speakers] ([person_id])
GO
ALTER TABLE [dbo].[EventsSpeakers] CHECK CONSTRAINT [FK_Speakers_EventsSpeakers]
GO
/****** Object:  ForeignKey [FK_Attendees_MechManiaTeams1]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[MechManiaTeams]  WITH CHECK ADD  CONSTRAINT [FK_Attendees_MechManiaTeams1] FOREIGN KEY([member1_id])
REFERENCES [dbo].[Attendees] ([person_id])
GO
ALTER TABLE [dbo].[MechManiaTeams] CHECK CONSTRAINT [FK_Attendees_MechManiaTeams1]
GO
/****** Object:  ForeignKey [FK_Attendees_MechManiaTeams2]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[MechManiaTeams]  WITH CHECK ADD  CONSTRAINT [FK_Attendees_MechManiaTeams2] FOREIGN KEY([member2_id])
REFERENCES [dbo].[Attendees] ([person_id])
GO
ALTER TABLE [dbo].[MechManiaTeams] CHECK CONSTRAINT [FK_Attendees_MechManiaTeams2]
GO
/****** Object:  ForeignKey [FK_Attendees_MechManiaTeams3]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[MechManiaTeams]  WITH CHECK ADD  CONSTRAINT [FK_Attendees_MechManiaTeams3] FOREIGN KEY([member3_id])
REFERENCES [dbo].[Attendees] ([person_id])
GO
ALTER TABLE [dbo].[MechManiaTeams] CHECK CONSTRAINT [FK_Attendees_MechManiaTeams3]
GO
/****** Object:  ForeignKey [FK_People_Speakers]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[Speakers]  WITH CHECK ADD  CONSTRAINT [FK_People_Speakers] FOREIGN KEY([person_id])
REFERENCES [dbo].[People] ([id])
GO
ALTER TABLE [dbo].[Speakers] CHECK CONSTRAINT [FK_People_Speakers]
GO
/****** Object:  ForeignKey [FK_StaffMembers_People]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[StaffMembers]  WITH CHECK ADD  CONSTRAINT [FK_StaffMembers_People] FOREIGN KEY([person_id])
REFERENCES [dbo].[People] ([id])
GO
ALTER TABLE [dbo].[StaffMembers] CHECK CONSTRAINT [FK_StaffMembers_People]
GO
/****** Object:  ForeignKey [FK_Volunteers_People]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[Volunteers]  WITH CHECK ADD  CONSTRAINT [FK_Volunteers_People] FOREIGN KEY([person_id])
REFERENCES [dbo].[People] ([id])
GO
ALTER TABLE [dbo].[Volunteers] CHECK CONSTRAINT [FK_Volunteers_People]
GO
/****** Object:  ForeignKey [FK_VolunteersVolunteerTimeSlots_Volunteers]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[VolunteersVolunteerTimeSlots]  WITH CHECK ADD  CONSTRAINT [FK_VolunteersVolunteerTimeSlots_Volunteers] FOREIGN KEY([volunteer_id])
REFERENCES [dbo].[Volunteers] ([person_id])
GO
ALTER TABLE [dbo].[VolunteersVolunteerTimeSlots] CHECK CONSTRAINT [FK_VolunteersVolunteerTimeSlots_Volunteers]
GO
/****** Object:  ForeignKey [FK_VolunteersVolunteerTimeSlots_VolunteerTimeSlots]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[VolunteersVolunteerTimeSlots]  WITH CHECK ADD  CONSTRAINT [FK_VolunteersVolunteerTimeSlots_VolunteerTimeSlots] FOREIGN KEY([volunteer_timeslot_id])
REFERENCES [dbo].[VolunteerTimeSlots] ([timeslot_id])
GO
ALTER TABLE [dbo].[VolunteersVolunteerTimeSlots] CHECK CONSTRAINT [FK_VolunteersVolunteerTimeSlots_VolunteerTimeSlots]
GO
/****** Object:  ForeignKey [FK_VolunteerTimeSlots_TimeSlots]    Script Date: 04/02/2010 14:54:57 ******/
ALTER TABLE [dbo].[VolunteerTimeSlots]  WITH CHECK ADD  CONSTRAINT [FK_VolunteerTimeSlots_TimeSlots] FOREIGN KEY([timeslot_id])
REFERENCES [dbo].[TimeSlots] ([id])
GO
ALTER TABLE [dbo].[VolunteerTimeSlots] CHECK CONSTRAINT [FK_VolunteerTimeSlots_TimeSlots]
GO
