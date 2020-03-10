﻿// <auto-generated />
using DataAgregationService.Db;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace DataAgregationService.Migrations
{
    [DbContext(typeof(ApplicationContext))]
    [Migration("20200310142006_Initial")]
    partial class Initial
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "3.1.2")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("DataAgregationService.Models.ApartComplex", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("CityName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Url")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("ApartComplexes");
                });

            modelBuilder.Entity("DataAgregationService.Models.Apartment", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("ComplexId")
                        .HasColumnType("int");

                    b.Property<int>("DwellingSpaceMax")
                        .HasColumnType("int");

                    b.Property<int>("DwellingSpaceMin")
                        .HasColumnType("int");

                    b.Property<string>("NumberOfRooms")
                        .HasColumnType("nvarchar(max)");

                    b.Property<decimal>("SquareMeterPriceMax")
                        .HasColumnType("decimal(18,2)");

                    b.Property<decimal>("SquareMeterPriceMin")
                        .HasColumnType("decimal(18,2)");

                    b.HasKey("Id");

                    b.HasIndex("ComplexId");

                    b.ToTable("Apartments");
                });

            modelBuilder.Entity("DataAgregationService.Models.Apartment", b =>
                {
                    b.HasOne("DataAgregationService.Models.ApartComplex", "Complex")
                        .WithMany("Apartments")
                        .HasForeignKey("ComplexId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });
#pragma warning restore 612, 618
        }
    }
}
