﻿

using System;
using System.Collections.Generic;
using System.Linq;

namespace Conferenceware.Models
{
	public class ConferencewareRepository : IRepository
	{
		protected ConferencewareDataContext _conferenceware = null;

		public ConferencewareRepository() : this(new ConferencewareDataContext())
		{
			// no additional actions needed
		}

		public ConferencewareRepository(ConferencewareDataContext context)
		{
			_conferenceware = context;
		}

		public void AddEvent(Event ev)
		{
			throw new NotImplementedException();
		}

		public void DeleteEvent(Event ev)
		{
			throw new NotImplementedException();
		}

		public void DeleteEvent(int id)
		{
			throw new NotImplementedException();
		}

		public void UpdateEvent(Event ev)
		{
			throw new NotImplementedException();
		}

		public Event GetEventById(int id)
		{
			throw new NotImplementedException();
		}

		public IQueryable<Event> GetAllEvents()
		{
			throw new NotImplementedException();
		}

		public void AddAttendee(Attendee attendee)
		{
			throw new NotImplementedException();
		}

		public void DeleteAttendee(Attendee attendee)
		{
			throw new NotImplementedException();
		}

		public void DeleteAttendee(int id)
		{
			throw new NotImplementedException();
		}

		public void UpdateAttendee(Attendee attendee)
		{
			throw new NotImplementedException();
		}

		public Attendee GetAttendeeById(int id)
		{
			throw new NotImplementedException();
		}

		public IQueryable<Attendee> GetAllAttendees()
		{
			throw new NotImplementedException();
		}

		public void AddLocation(Location location)
		{
			_conferenceware.Locations.InsertOnSubmit(location);
		}

		public void DeleteLocation(Location location)
		{
			_conferenceware.Locations.DeleteOnSubmit(location);
		}

		public void DeleteLocation(int id)
		{
			DeleteLocation(GetLocationById(id));
		}

		public void UpdateLocation(Location location)
		{
			_conferenceware.Locations.Attach(location, true);
		}

		public Location GetLocationById(int id)
		{
			return _conferenceware.Locations.SingleOrDefault(x => x.id == id);
		}

		public IQueryable<Location> GetAllLocations()
		{
			return _conferenceware.Locations.AsQueryable();
		}

		public void AddTimeSlot(TimeSlot timeslot)
		{
			throw new NotImplementedException();
		}

		public void DeleteTimeSlot(TimeSlot timeslot)
		{
			throw new NotImplementedException();
		}

		public void DeleteTimeSlot(int id)
		{
			throw new NotImplementedException();
		}

		public void UpdateTimeSlot(TimeSlot timeslot)
		{
			throw new NotImplementedException();
		}

		public TimeSlot GetTimeSlotById(int id)
		{
			throw new NotImplementedException();
		}

		public IQueryable<TimeSlot> GetAllTimeSlots()
		{
			throw new NotImplementedException();
		}

		public void AddSpeaker(Speaker speaker)
		{
			throw new NotImplementedException();
		}

		public void DeleteSpeaker(Speaker speaker)
		{
			throw new NotImplementedException();
		}

		public void DeleteSpeaker(int id)
		{
			throw new NotImplementedException();
		}

		public void UpdateSpeaker(Speaker speaker)
		{
			throw new NotImplementedException();
		}

		public Speaker GetSpeakerById(int id)
		{
			throw new NotImplementedException();
		}

		public IQueryable<Speaker> GetAllSpeakers()
		{
			throw new NotImplementedException();
		}

		public void RegisterAttendeeForEvent(Attendee attendee, Event ev)
		{
			throw new NotImplementedException();
		}

		public void RegisterSpeakerForEvent(Speaker speaker, Event ev)
		{
			throw new NotImplementedException();
		}

		public void Save()
		{
			_conferenceware.SubmitChanges();
		}
	}

}