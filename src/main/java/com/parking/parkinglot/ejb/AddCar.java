package com.parking.parkinglot.ejb;

import com.example.dto.UserDto;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddCar", value = "/AddCar")
public class AddCar extends HttpServlet {

    @Inject
    UserBean userBean;
    CarsBean carsBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {

        List<UserDto> users=userBean.getUsers();
        request.setAttribute("users",users);
        request.getRequestDispatcher("/WEB-INF/addcar.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse
            response, CarsBean carsBean) throws ServletException, IOException {
        String licensePlate=request.getParameter("license_plate");
        String parkingSpot=request.getParameter("parking_spot");
        Long userId=Long.parseLong(request.getParameter("owner_id"));


        carsBean.createCar(licensePlate,parkingSpot,userId);
        response.sendRedirect(request.getContextPath()+"/Cars");
    }
}