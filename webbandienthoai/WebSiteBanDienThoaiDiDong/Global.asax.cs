using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using WebSiteBanDienThoaiDiDong.ThaoTac;

namespace WebSiteBanDienThoaiDiDong
{
    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            Application["SoNguoiOnline"] = 0;
            LuotTruyCap So = new LuotTruyCap();
            double Luot = So.Doc();
            Application["SoLuotTruyCap"] = Luot;

        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown
            Application.Lock();
            Application["SoNguoiOnline"] = Convert.ToInt32(Application["SoNguoiOnline"]) - 1;
            Application.UnLock();
        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started
            Session.Timeout = 20;
            Application.Lock();
            Application["SoNguoiOnline"] = Convert.ToInt32(Application["SoNguoiOnline"]) + 1;
            LuotTruyCap So = new LuotTruyCap();
            So.Ghi(Convert.ToDouble(Application["SoLuotTruyCap"]) + 1);
            Application["SoLuotTruyCap"] = So.Doc();
            Application.UnLock();

        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.
            Application.Lock();
            Application["SoNguoiOnline"] = Convert.ToInt32(Application["SoNguoiOnline"]) - 1;
            Application.UnLock();


        }

    }
}
