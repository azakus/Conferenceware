﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Admin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Admin Resources</h2>
    <ul>
        <li><%=Html.ActionLink("Attendees", "Index", "Attendee")%></li>
        <li><%=Html.ActionLink("Badges", "Index", "Badge")%></li>
        <li><%=Html.ActionLink("Check In Interface (no auth needed)", "Index", "AttendeeCheckIn") %></li>
        <li><%=Html.ActionLink("Companies", "Index", "Company") %></li>
        <li><%=Html.ActionLink("Email People", "Index", "Email")%></li>
        <li><%=Html.ActionLink("Events", "Index", "Event")%></li>
        <li><%=Html.ActionLink("Foods", "Index", "Food")%></li>
        <li><%=Html.ActionLink("Locations", "Index", "Location")%></li>
        <li><%=Html.ActionLink("MechMania Teams", "Index", "MechManiaTeam")%></li>
        <li><%=Html.ActionLink("Pages", "Index", "PageManager")%></li>
        <li><%=Html.ActionLink("Scheduling", "Index", "Scheduling") %></li>
        <li><%=Html.ActionLink("Settings","Index","Settings")%></li>
        <li><%=Html.ActionLink("Speakers", "Index", "Speaker")%></li>
        <li><%=Html.ActionLink("Staff", "Index", "StaffMember")%></li>
        <li><%=Html.ActionLink("T-Shirt Sizes", "Index", "TShirtSize")%></li>
        <li><%=Html.ActionLink("Time Slots", "Index", "TimeSlot")%></li>
        <li><%=Html.ActionLink("Volunteer Time Slots",
			                                  "Index",
			                                  "VolunteerTimeSlot")%></li>
        <li><%=Html.ActionLink("Volunteers", "Index", "Volunteer")%></li>
    </ul>
</asp:Content>
