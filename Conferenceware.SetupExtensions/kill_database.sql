USE [Conferenceware]
GO
ALTER TABLE [dbo].[Companies] DROP CONSTRAINT [DF_Companies_needs_power]
GO
ALTER TABLE [dbo].[Companies] DROP CONSTRAINT [DF_Companies_priority_shipping]
GO
ALTER TABLE [dbo].[CompanyInvoices] DROP CONSTRAINT [DF_CompanyInvoices_paid]
GO
ALTER TABLE [dbo].[CompanyPeople] DROP CONSTRAINT [DF_CompanyPeople_is_contact]
GO
ALTER TABLE [dbo].[CompanyPeople] DROP CONSTRAINT [DF_CompanyPeople_is_attending]
GO
ALTER TABLE [dbo].[EventContentLinks] DROP CONSTRAINT [DF_EventContentLinks_list_on_video_page]
GO
ALTER TABLE [dbo].[Events] DROP CONSTRAINT [DF_Events_is_visible]
GO
ALTER TABLE [dbo].[Pages] DROP CONSTRAINT [DF_Pages_parent_id]
GO
ALTER TABLE [dbo].[People] DROP CONSTRAINT [DF_People_is_alum]
GO
ALTER TABLE [dbo].[VolunteersVolunteerTimeSlots] DROP CONSTRAINT [DF_VolunteersVolunteerTimeSlots_is_scheduled]
GO
ALTER TABLE [dbo].[VolunteersVolunteerTimeSlots] DROP CONSTRAINT [DF_VolunteersVolunteerTimeSlots_is_confirmed]
GO
ALTER TABLE [dbo].[VolunteerTimeSlots] DROP CONSTRAINT [DF_VolunteerTimeSlots_is_video]
GO
/****** Object:  ForeignKey [FK_Foods_Attendees]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[Attendees] DROP CONSTRAINT [FK_Foods_Attendees]
GO
/****** Object:  ForeignKey [FK_People_Attendees]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[Attendees] DROP CONSTRAINT [FK_People_Attendees]
GO
/****** Object:  ForeignKey [FK_TShirts_Attendees]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[Attendees] DROP CONSTRAINT [FK_TShirts_Attendees]
GO
/****** Object:  ForeignKey [FK_CompanyInvoiceItems_CompanyInvoices]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[CompanyInvoiceItems] DROP CONSTRAINT [FK_CompanyInvoiceItems_CompanyInvoices]
GO
/****** Object:  ForeignKey [FK_CompanyInvoices_Companies]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[CompanyInvoices] DROP CONSTRAINT [FK_CompanyInvoices_Companies]
GO
/****** Object:  ForeignKey [FK_CompanyPayments_Companies]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[CompanyPayments] DROP CONSTRAINT [FK_CompanyPayments_Companies]
GO
/****** Object:  ForeignKey [FK_CompanyPeople_Companies]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[CompanyPeople] DROP CONSTRAINT [FK_CompanyPeople_Companies]
GO
/****** Object:  ForeignKey [FK_CompanyPeople_People]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[CompanyPeople] DROP CONSTRAINT [FK_CompanyPeople_People]
GO
/****** Object:  ForeignKey [FK_EventContentLinks_Events]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[EventContentLinks] DROP CONSTRAINT [FK_EventContentLinks_Events]
GO
/****** Object:  ForeignKey [FK_Locations_Events]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[Events] DROP CONSTRAINT [FK_Locations_Events]
GO
/****** Object:  ForeignKey [FK_TimeSlots_Events]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[Events] DROP CONSTRAINT [FK_TimeSlots_Events]
GO
/****** Object:  ForeignKey [FK_Attendees_EventsAttendees]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[EventsAttendees] DROP CONSTRAINT [FK_Attendees_EventsAttendees]
GO
/****** Object:  ForeignKey [FK_Events_EventsAttendees]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[EventsAttendees] DROP CONSTRAINT [FK_Events_EventsAttendees]
GO
/****** Object:  ForeignKey [FK_Events_EventsSpeakers]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[EventsSpeakers] DROP CONSTRAINT [FK_Events_EventsSpeakers]
GO
/****** Object:  ForeignKey [FK_Speakers_EventsSpeakers]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[EventsSpeakers] DROP CONSTRAINT [FK_Speakers_EventsSpeakers]
GO
/****** Object:  ForeignKey [FK_Attendees_MechManiaTeams1]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[MechManiaTeams] DROP CONSTRAINT [FK_Attendees_MechManiaTeams1]
GO
/****** Object:  ForeignKey [FK_Attendees_MechManiaTeams2]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[MechManiaTeams] DROP CONSTRAINT [FK_Attendees_MechManiaTeams2]
GO
/****** Object:  ForeignKey [FK_Attendees_MechManiaTeams3]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[MechManiaTeams] DROP CONSTRAINT [FK_Attendees_MechManiaTeams3]
GO
/****** Object:  ForeignKey [FK_People_Speakers]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[Speakers] DROP CONSTRAINT [FK_People_Speakers]
GO
/****** Object:  ForeignKey [FK_StaffMembers_People]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[StaffMembers] DROP CONSTRAINT [FK_StaffMembers_People]
GO
/****** Object:  ForeignKey [FK_Volunteers_People]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[Volunteers] DROP CONSTRAINT [FK_Volunteers_People]
GO
/****** Object:  ForeignKey [FK_VolunteersVolunteerTimeSlots_Volunteers]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[VolunteersVolunteerTimeSlots] DROP CONSTRAINT [FK_VolunteersVolunteerTimeSlots_Volunteers]
GO
/****** Object:  ForeignKey [FK_VolunteersVolunteerTimeSlots_VolunteerTimeSlots]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[VolunteersVolunteerTimeSlots] DROP CONSTRAINT [FK_VolunteersVolunteerTimeSlots_VolunteerTimeSlots]
GO
/****** Object:  ForeignKey [FK_VolunteerTimeSlots_TimeSlots]    Script Date: 04/10/2010 16:20:56 ******/
ALTER TABLE [dbo].[VolunteerTimeSlots] DROP CONSTRAINT [FK_VolunteerTimeSlots_TimeSlots]
GO
/****** Object:  Table [dbo].[CompanyInvoiceItems]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[CompanyInvoiceItems]
GO
/****** Object:  Table [dbo].[EventContentLinks]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[EventContentLinks]
GO
/****** Object:  Table [dbo].[EventsAttendees]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[EventsAttendees]
GO
/****** Object:  Table [dbo].[EventsSpeakers]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[EventsSpeakers]
GO
/****** Object:  Table [dbo].[MechManiaTeams]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[MechManiaTeams]
GO
/****** Object:  Table [dbo].[VolunteersVolunteerTimeSlots]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[VolunteersVolunteerTimeSlots]
GO
/****** Object:  Table [dbo].[VolunteerTimeSlots]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[VolunteerTimeSlots]
GO
/****** Object:  Table [dbo].[Volunteers]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[Volunteers]
GO
/****** Object:  Table [dbo].[Speakers]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[Speakers]
GO
/****** Object:  Table [dbo].[StaffMembers]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[StaffMembers]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[Events]
GO
/****** Object:  Table [dbo].[CompanyInvoices]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[CompanyInvoices]
GO
/****** Object:  Table [dbo].[CompanyPayments]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[CompanyPayments]
GO
/****** Object:  Table [dbo].[CompanyPeople]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[CompanyPeople]
GO
/****** Object:  Table [dbo].[Attendees]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[Attendees]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[Companies]
GO
/****** Object:  Table [dbo].[Foods]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[Foods]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[Locations]
GO
/****** Object:  Table [dbo].[TimeSlots]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[TimeSlots]
GO
/****** Object:  Table [dbo].[TShirtSizes]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[TShirtSizes]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[Pages]
GO
/****** Object:  Table [dbo].[People]    Script Date: 04/10/2010 16:20:56 ******/
DROP TABLE [dbo].[People]
GO
