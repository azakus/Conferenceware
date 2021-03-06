﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Conferenceware.Models.Attendee>>" %>
<%@ Import Namespace="Conferenceware.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Attendee Management
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Name
            </th>
            <th>
                Food
            </th>
            <th>
                TShirt
            </th>
        </tr>

    <%
    	foreach (Attendee item in Model)
     {%>
    
        <tr>
            <td>
                <%=Html.ActionLink("Edit",
     	                                  "Edit",
     	                                  new {id = item.person_id})%> |
                <%=Html.ActionLink("Delete",
     	                                  "Delete",
     	                                  new {id = item.person_id})%>
            </td>
            <td>
                <%=Html.Encode(item.People.name)%>
            </td>
            <td>
                <%=Html.Encode(item.Food.name)%>
            </td>
            <td>
                <%=Html.Encode(item.TShirtSize.name)%>
            </td>
        </tr>
    
    <%
     }%>

    </table>
    <p>
        There are <%=Html.Encode(Model.Count())%> attendees.
    </p>
    <p>
        <%=Html.ActionLink("Create New", "Create")%>
    </p>

</asp:Content>

