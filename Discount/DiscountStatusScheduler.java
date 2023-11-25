package com.mycompany.doca_java.Controller.ManageOwner.personal_Product;

import com.mycompany.doca_java.DAO.DiscountDAO;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

@WebListener
public class DiscountStatusScheduler implements ServletContextListener {

    private Timer timer;

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        timer = new Timer();

        // Lấy thời gian hiện tại
        LocalDateTime currentDateTime = LocalDateTime.now();

        // Tính thời gian chờ đến 00:00 AM ngày tiếp theo
        LocalDateTime nextDayStart = currentDateTime.toLocalDate().plusDays(1).atStartOfDay();
        long delay = calculateDelayToNextDay(nextDayStart);

        // Lên lịch gọi hàm updateDiscountStatus() vào lúc 00:00 AM hàng ngày
        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                try {
                    DiscountDAO dao = new DiscountDAO();
                    dao.updateDiscountStatus();
                } catch (SQLException ex) {
                    Logger.getLogger(DiscountStatusScheduler.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(DiscountStatusScheduler.class.getName()).log(Level.SEVERE, null, ex);
                } catch (NamingException ex) {
                    Logger.getLogger(DiscountStatusScheduler.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }, delay, 24 * 60 * 60 * 1000); // 24 giờ

       
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        timer.cancel();
        System.out.println("DiscountStatusScheduler stopped.");
    }

    private long calculateDelayToNextDay(LocalDateTime nextDayStart) {
        // Tính thời gian chờ đến ngày tiếp theo (00:00 AM)
        Date nextDayStartAsDate = Date.from(nextDayStart.atZone(ZoneId.systemDefault()).toInstant());
        Date currentDateTime = new Date();
        long delay = nextDayStartAsDate.getTime() - currentDateTime.getTime();
        if (delay < 0) {
            delay = 0;
        }
        return delay;
    }

}
