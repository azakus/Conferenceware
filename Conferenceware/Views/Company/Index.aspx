﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Conferenceware.Models.Company>>" %>
<%@ Import Namespace="Conferenceware.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
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
                Needs Power
            </th>
            <th>
                Priority Shipping
            </th>
        </tr>

    <%
    	foreach (Company item in Model)
     {%>
    
        <tr>
            <td>
                <%=Html.ActionLink("Edit", "Edit", new {item.id})%> |
                <%=Html.ActionLink("Details", "Details", new {item.id})%> |
                <%=Html.ActionLink("Delete", "Delete", new {item.id})%>
            </td>
            <td>
                <%=Html.Encode(item.name)%>
            </td>
            <td>
                <%=Html.Encode(item.needs_power)%>
            </td>
            <td>
                <%=Html.Encode(item.priority_shipping)%>
            </td>
        </tr>
    
    <%
     }%>

    </table>

    <p>
        <%=Html.ActionLink("Create New", "Create")%>
    </p>

</asp:Content>

