package com.housing;


import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Data
 */
public class Data extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Data() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String City = request.getParameter("cd-dropdown");
		String Location = request.getParameter("Location");
		String Area = request.getParameter("Area");
		String Price = request.getParameter("Price");
		String PopDen = request.getParameter("cd-dropdown03");
		String Type = request.getParameter("cd-dropdown04");
		
		
		HomeDb hmd = new HomeDb();
		List<Properties> result;
		String Bad= "-1";
		if(PopDen.equalsIgnoreCase(Bad)|| Type.equalsIgnoreCase(Bad))
			result = hmd.SelectLand(City, Location, Area, Price);
		else
			result = hmd.SelectLandPopu(City, Location, Area, Price,PopDen,Type);
		request.setAttribute("listData", result);
	    RequestDispatcher rd = getServletContext()
	                               .getRequestDispatcher("/Map.jsp");
	    rd.forward(request, response);
	}

}
