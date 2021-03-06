﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Conferenceware.Models.Company>" %>
<%@ Import Namespace="Conferenceware.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label"><%=Html.LabelFor(x => x.name)%></div>
        <div class="display-field"><%=Html.Encode(Model.name)%></div>
        
        <div class="display-label"><%=Html.LabelFor(x => x.address_line1)%></div>
        <div class="display-field"><%=Html.Encode(Model.address_line1)%></div>
        
        <div class="display-label"><%=Html.LabelFor(x => x.address_line2)%></div>
        <div class="display-field"><%=Html.Encode(Model.address_line2)%></div>
        
        <div class="display-label"><%=Html.LabelFor(x => x.city)%></div>
        <div class="display-field"><%=Html.Encode(Model.city)%></div>
        
        <div class="display-label"><%=Html.LabelFor(x => x.state)%></div>
        <div class="display-field"><%=Html.Encode(Model.state)%></div>
        
        <div class="display-label"><%=Html.LabelFor(x => x.zip)%></div>
        <div class="display-field"><%=Html.Encode(Model.zip)%></div>
        
        <div class="display-label"><%=Html.LabelFor(x => x.needs_power)%></div>
        <div class="display-field"><%=Html.Encode(Model.needs_power)%></div>
        
        <div class="display-label"><%=Html.LabelFor(x => x.priority_shipping)%></div>
        <div class="display-field"><%=Html.Encode(Model.priority_shipping)%></div>
        
        <div class="display-label"><%=Html.LabelFor(x => x.TotalOwed)%></div>
        <div class="display-field"><%=Html.Encode(String.Format("{0:C}", Model.TotalOwed))%></div>
        
        <div class="display-label">People</div>
        <div class="display-field">
            <ul>
                <%
                	foreach (CompanyPerson cp in Model.CompanyPersons)
                 {%>
                <li class="entry-with-inline-form">
                    <%
                 	using (Html.BeginForm("Delete", "CompanyPerson"))
                 	{%>
                    <%=Html.Hidden("person_id", cp.person_id)%>
                    <input type="submit" value="Delete" />
                    <%
                 	}%>
                    <%=Html.ActionLink(cp.People.name,
                 	                                  "Edit",
                 	                                  "CompanyPerson",
                 	                                  new {id = cp.person_id},
                 	                                  null)%>
                </li>
                <%
                 }%>
            </ul>
            <%=Html.ActionLink("Create Company Person",
			                                  "Create",
			                                  "CompanyPerson",
			                                  new {Model.id},
			                                  null)%>
        </div>
         
        <div class="display-label">Invoices</div>
        <div class="display-field">
            <ul>
                <%
                	foreach (CompanyInvoice invoice in Model.CompanyInvoices)
                 {%>
                <li class="entry-with-inline-form">
                    <%
                 	using (
                 		Html.BeginForm("Delete", "CompanyInvoice", FormMethod.Get))
                 	{%>
                    <%=Html.Hidden("InvoiceId", invoice.InvoiceId)%>
                    <input type="submit" value="Delete" />
                    <%
                 	}%>
                    <%=
                 		Html.ActionLink(
                 			String.Format("{0} (Last Sent {1})",
                 			              invoice.id,
                 			              invoice.last_sent <= invoice.created
                 			              	? "Never"
                 			              	: invoice.last_sent.ToString()),
                 			"Edit",
                 			"CompanyInvoice",
                 			new {invoice.id},
                 			null)%> (<%= Html.ActionLink("Download", "DownloadInvoice", new { invoice.id })%> |
    <%= Html.ActionLink("Email", "Email", "CompanyInvoice", new { Model.id }, null)%>)
                </li>
                <%
                 }%>
            </ul>
            <div class="display-label"><%=Html.LabelFor(x => x.InvoiceTotal)%></div>
            <div class="display-field"><%=Html.Encode(String.Format("{0:C}", Model.InvoiceTotal))%></div>
            <%=Html.ActionLink("Create Invoice",
			                                  "Create",
			                                  "CompanyInvoice",
			                                  new {Model.id},
			                                  null)%>
        </div>
        
        <div class="display-label">Payments</div>
        <div class="display-field">
            <ul>
                <%
                	foreach (CompanyPayment payment in Model.CompanyPayments)
                 {%>
                <li class="entry-with-inline-form">
                    <%
                 	using (Html.BeginForm("Delete", "CompanyPayment"))
                 	{%>
                    <%=Html.Hidden("payment_id",
                 		                              payment.payment_id)%>
                    <input type="submit" value="Delete" />
                    <%
                 	}%>
                    <%=
                 		Html.ActionLink(
                 			String.Format("{0} (Received {1})",
                 			              payment.id,
                 			              payment.received_date),
                 			"Edit",
                 			"CompanyPayment",
                 			new {payment.id},
                 			null)%>
                </li>
                <%
                 }%>
            </ul>
            <div class="display-label"><%=Html.LabelFor(x => x.PaymentsTotal)%></div>
            <div class="display-field"><%=Html.Encode(String.Format("{0:C}", Model.PaymentsTotal))%></div>
            <%=Html.ActionLink("Create Payment",
			                                  "Create",
			                                  "CompanyPayment",
			                                  new {Model.id},
			                                  null)%>
        </div>
       
    </fieldset>
    <p>

        <%=Html.ActionLink("Edit", "Edit", new {Model.id})%> |
        <%=Html.ActionLink("Back to List", "Index")%>
    </p>

</asp:Content>

