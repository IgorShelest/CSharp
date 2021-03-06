﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;
using WebAPIApplication.AutoMapper.TypeConverters;
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
            
            // CustomerInTransaction Mapping
            Mapper.CreateMap<CustomerModel, CustomerInTransactionDto>();
            Mapper.CreateMap<CustomerInTransactionDto, CustomerModel>();

            // Transaction Mapping
            Mapper.CreateMap<TransactionModel, TransactionDto>();
            Mapper.CreateMap<TransactionDto, TransactionModel>().ForMember(transaction => transaction.Id, option => option.Ignore()); ;

            // TransactionInCustomer Mapping
            Mapper.CreateMap<TransactionModel, TransactionInCustomerDto>();
            Mapper.CreateMap<TransactionInCustomerDto, TransactionModel>();

            // CurrencyCode Mapping
            Mapper.CreateMap<CurrencyCode, string>().ConvertUsing<CurrencyCodeToStringConverter>();
            Mapper.CreateMap<string, CurrencyCode>().ConvertUsing<StringToCurrencyCodeConverter>();

            // TransactionStatus Mapping
            Mapper.CreateMap<TransactionStatus, string>().ConvertUsing<TransactionStatusToStringConverter>();
            Mapper.CreateMap<string, TransactionStatus>().ConvertUsing<StringToTransactionStatusConverter>();
        }
    }
}