﻿using System.Web.Mvc;
using Conferenceware.Controllers;
using Conferenceware.Models;
using Conferenceware.Tests.Models;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Conferenceware.Tests.Controllers
{
    [TestClass]
    public class FoodControllerTest
    {
        private readonly IRepository _repository = new TestRepository();

        [TestMethod]
        public void Index()
        {
            var controller = new FoodController(_repository);

            var result = controller.Index() as ViewResult;

            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void CreateTest()
        {
        }

        [TestMethod]
        public void EditTest()
        {
        }

        [TestMethod]
        public void DeleteTest()
        {
        }
    }
}