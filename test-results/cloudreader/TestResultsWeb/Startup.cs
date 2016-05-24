using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TestResultsWeb.Startup))]
namespace TestResultsWeb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
