﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;
using WebAPIApplication.Dtos;
using WebAPIApplication.Models;

namespace WebAPIApplication.AutoMapper
{
    public class MappingProfile: Profile
    {
        public MappingProfile()
        {
            // Customer Mapping
            Mapper.CreateMap<CustomerModel, CustomerDto>();
            Mapper.CreateMap<CustomerDto, CustomerModel>().ForMember(customer => customer.Id, option => option.Ignore());

            // Transaction Mapping
            Mapper.CreateMap<TransactionModel, TransactionDto>();
            Mapper.CreateMap<TransactionDto, TransactionModel>().ForMember(transaction => transaction.Id, option => option.Ignore());
        }
    }
}