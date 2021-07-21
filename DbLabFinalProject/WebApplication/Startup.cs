using AutoMapper;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using AutFinalProject.Data;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.OpenApi.Models;
using AutFinalProject.Option;
using AutFinalProject.Repositories;
using AutFinalProject.Repositories.Imp;

namespace AutFinalProject
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<DataContext>(options =>
                options.UseSqlServer(
                    Configuration.GetConnectionString("DefaultConnection")));
            services.AddDefaultIdentity<IdentityUser>()
                .AddEntityFrameworkStores<DataContext>();

            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);

            services.AddAutoMapper(typeof(Startup));

            services.AddScoped<ICommentRepository, CommentRepository>();
            services.AddScoped<ICustomerRepositroy, CustomerRepository>();
            services.AddScoped<IOrderRepository, OrderRepository>();
            services.AddScoped<IDiscountRepository, DiscountRepository>();
            services.AddScoped<IProductRepository, ProductRepository>();

            //add swagger to services-----------------------------------------------------------------------
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo {Title = "My API", Version = "v1"});
               
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = "JWT authorization header using the bearer shcheme",
                    Name = "Authorization", 
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey
                });
                
                c.AddSecurityRequirement(new OpenApiSecurityRequirement  
                {  
                    {  
                        new OpenApiSecurityScheme  
                        {  
                            Reference = new OpenApiReference  
                            {  
                                Type = ReferenceType.SecurityScheme,  
                                Id = "Bearer"  
                            }  
                        },  
                        new string[] {}
                    }  
                });
            });
            //-----------------------------------------------------------------------------------------------
            
            services.AddCors(options =>
            {
                options.AddPolicy("AllowAllHeaders",
                    builder =>
                    {
                        builder.AllowAnyOrigin()
                            .AllowAnyHeader()
                            .AllowAnyMethod();
                    });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseHsts();
            }

            var swaggerOption = new SwaggerOption();
            Configuration.GetSection(nameof(SwaggerOption)).Bind(swaggerOption);
            //this lines for configure swagger---------------------------------------------------------------------------------------------------
            app.UseSwagger(opt => { opt.RouteTemplate = swaggerOption.JsonRoute; });
            app.UseSwaggerUI(opt => { opt.SwaggerEndpoint(swaggerOption.UIEndpoint, swaggerOption.Description); });
            app.UseHttpsRedirection();
            app.UseStaticFiles();
            //----------------------------------------------------------------------------------------------------------------------------------- 
            
            app.UseAuthentication();
            
            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });
            
            app.UseCors("AllowAllHeaders");
        }
    }
}