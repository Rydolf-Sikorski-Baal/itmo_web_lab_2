package org.ait;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class AreaCheckServlet extends HttpServlet {

    static String JSPPath = "/WEB-INF/page.jsp";
    static String PAGE_HEADER = "<html><head><title>area-check</title></head><body>";

    static String PAGE_FOOTER = "</body></html>";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        PrintWriter writer = resp.getWriter();

        writer.println(PAGE_HEADER);
        writer.println("<h2>" + "this is area checker servlet indeed" + "</h2>");
        writer.println(PAGE_FOOTER);

        writer.close();
    }

    @Override
    protected synchronized void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int x, y, r;
        if (request.getParameter("X") != null){
            x = Integer.parseInt(request.getParameter("X"));
            y = Integer.parseInt(request.getParameter("Y"));
            r = Integer.parseInt(request.getParameter("R"));
        }else{
            x = Integer.parseInt(request.getParameter("imageInput.x"));
            y = Integer.parseInt(request.getParameter("imageInput.y"));
            r = 1;//Integer.parseInt(request.getParameter("R"));

            x -= 110;
            y = 104 - y;
            r *= 79;
        }

        String flag = "not in the area";
        if (x >= 0 && y >= 0){
            if (x == 0 && y == 0) flag = "in the center";
        }
        if (x >= 0 && y <= 0){
            if (x <= r && -y <= r/2) flag = "in the rectangle";
        }
        if (x <= 0 && y >= 0){
            if (2*x + r >= y) flag = "in the triangle";
        }
        if (x <= 0 && y <= 0){
            if (x*x + y*y <= r*r/4) flag = "in the circle";
        }

        List<Object> curr = new ArrayList<>();
        curr.add(x); curr.add(y); curr.add(r); curr.add(flag);
        ResultsBean.results.add(curr);

        request.setAttribute("count", ++ResultsBean.count);
        request.setAttribute("res", flag);
        request.setAttribute("results", ResultsBean.results);
        request.getRequestDispatcher(JSPPath).forward(request, response);
    }

}