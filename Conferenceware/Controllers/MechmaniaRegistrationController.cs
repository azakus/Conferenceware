﻿using System;
using System.Linq;
using System.Net.Mail;
using System.Web.Mvc;
using Conferenceware.Models;
using Conferenceware.Utils;

namespace Conferenceware.Controllers
{
	public class MechmaniaRegistrationController : Controller
	{
		private readonly IRepository _repository;

		/// <summary>
		/// Repository to interact with the database
		/// </summary>
		public MechmaniaRegistrationController()
			: this(new ConferencewareRepository())
		{
		}

		public MechmaniaRegistrationController(IRepository repo)
		{
			_repository = repo;
		}

		//
		// GET: /MechmaniaRegistration/

		public ActionResult Index()
		{
			if (!MechmaniaRegistrationIsOpen())
			{
				return View("RegistrationClosed");
			}
			return View("Index", new MechmaniaTeamEditData());
		}

		//
		// POST: /MechmaniaRegistration/

		[HttpPost]
		public ActionResult Index(MechmaniaTeamEditData mmted)
		//FormCollection collection)
		{
			if (!MechmaniaRegistrationIsOpen())
			{
				return View("RegistrationClosed");
			}
			Attendee att1 =
				_repository.GetAllAttendees().SingleOrDefault(
					x => x.People.email == mmted.member_email_1);
			if (att1 == null)
			{
				ModelState.AddModelError("member_email_1",
										 "Email not found; did you register?");
			}
			Attendee att2 =
				_repository.GetAllAttendees().SingleOrDefault(
					x => x.People.email == mmted.member_email_2);
			if (att2 == null)
			{
				ModelState.AddModelError("member_email_2",
										 "Email not found; did you register?");
			}
			Attendee att3 =
				_repository.GetAllAttendees().SingleOrDefault(
					x => x.People.email == mmted.member_email_3);
			if (att3 == null)
			{
				ModelState.AddModelError("member_email_3",
										 "Email not found; did you register?");
			}
			if (ModelState.IsValid)
			{
				var mmt = new MechManiaTeam
							{
								team_name = mmted.team_name,
								member1_id = att1.person_id,
								member2_id = att2.person_id,
								member3_id = att3.person_id,
								account_name = "",
								account_password = ""
							};
				_repository.AddMechManiaTeam(mmt);
				_repository.Save();
				SettingsData settings = SettingsData.Default;
				var message1 = new MailMessage(settings.EmailFrom,
											   att1.People.email,
											   settings.RegistrationSubject,
											   settings.RegistrationMessage.Replace(
												"{name}", att1.People.name).Replace(
													"{role}", "Mechmania Participant"));
				var message2 = new MailMessage(settings.EmailFrom,
											   att2.People.email,
											   settings.RegistrationSubject,
											   settings.RegistrationMessage.Replace(
												"{name}", att2.People.name).Replace(
													"{role}", "Mechmania Participant"));
				var message3 = new MailMessage(settings.EmailFrom,
											   att3.People.email,
											   settings.RegistrationSubject,
											   settings.RegistrationMessage.Replace(
												"{name}", att3.People.name).Replace(
													"{role}", "Mechmania Participant"));
				try
				{
					Mailer.Send(message1);
					Mailer.Send(message2);
					Mailer.Send(message3);
				}
				catch
				{
					//TODO: log this
				}
				return RedirectToAction("Success");
			}
			return View("Index", mmted);
		}

		public ActionResult Success()
		{
			return View("Success");
		}

		private bool MechmaniaRegistrationIsOpen()
		{
			return !(SettingsData.Default.MechManiaRegistrationAutoCloseDateTime < DateTime.Now
				|| (SettingsData.Default.MaxMechManiaTeams > 0 &&
					SettingsData.Default.MaxMechManiaTeams <= _repository.GetAllMechManiaTeams().Count()));
		}
	}
}