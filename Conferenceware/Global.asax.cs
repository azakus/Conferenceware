﻿using System;
using System.IO;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Conferenceware.Models;

namespace Conferenceware
{
	// Note: For instructions on enabling IIS6 or IIS7 classic mode, 
	// visit http://go.microsoft.com/?LinkId=9394801

	public class MvcApplication : HttpApplication
	{
		public static void RegisterRoutes(RouteCollection routes)
		{
			routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

			routes.MapRoute(
				"Page",
				"Page/{name}",
				new { controller = "Page", action = "Display" }
				);

			routes.MapRoute(
				"Default",
				// Route name
				"{controller}/{action}/{id}",
				// URL with parameters
				new { controller = "Home", action = "Index", id = "" } // Parameter defaults
				);
		}

		protected void Application_Start()
		{
			AreaRegistration.RegisterAllAreas();

			RegisterRoutes(RouteTable.Routes);
		}

		public override string GetVaryByCustomString(HttpContext context,
													 string custom)
		{
			if (custom == "settings")
			{
				return
					File.GetLastWriteTime(AppDomain.CurrentDomain.BaseDirectory +
										  SettingsData.RESOURCE_FILE_DIR + "\\" +
										  SettingsData.RESOURCE_FILE_NAME +
										  SettingsData.RESOURCE_FILE_EXT).
						ToString();
			}
			return base.GetVaryByCustomString(context, custom);
		}
	}
}