﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using WebAPIApplication.ValidationRules;

namespace WebAPIApplication.Models
{
    public class CustomerModel
    {
        public int Id { get; set; }

        [DataType(DataType.Text)]
        public string Name { get; set; }

        [EmailAddress(ErrorMessage = "Email Address is invalid")]
        public string Email { get; set; }

        [PhoneValidation(ErrorMessage = "Phone Number is incorrect. Use '(xxx)xxx-xx-xx' pattern")]
        public string MobileNumber { get; set; }

        public IEnumerable<TransactionModel> Transactions { get; set; }
    }
}