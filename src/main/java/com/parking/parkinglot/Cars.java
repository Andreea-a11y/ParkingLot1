package com.parking.parkinglot;

import com.parking.parkinglot.common.CarDto;
import com.parking.parkinglot.ejb.CarsBean;
import jakarta.annotation.security.DeclareRoles;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@DeclareRoles({"READ_CARS", "WRITE_CARS"})
@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"READ_CARS"}),
        httpMethodConstraints = {@HttpMethodConstraint(value = "POST", rolesAllowed = {"WRITE_CARS"})})
@WebServlet(name = "Cars", value = "/Cars")
public class Cars extends HttpServlet {



    @Inject
    CarsBean carsBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obține lista de mașini
        List<CarDto> cars = carsBean.findAllCars();
        request.setAttribute("cars", cars);

        // Setează numărul de locuri de parcare disponibile (de exemplu, static pentru demonstrație)
        request.setAttribute("numberOfFreeParkingSpots", 10);

        // Trimite răspunsul la pagina JSP
        request.getRequestDispatcher("/WEB-INF/pages/cars.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obține parametrii carId din request
        String[] carIdsAsString = request.getParameterValues("carId");

        if (carIdsAsString != null) {
            List<Long> carIds = new ArrayList<>();

            // Conversie corectă a ID-urilor din String în Long
            Arrays.stream(carIdsAsString).forEach(carId -> carIds.add(Long.parseLong(carId)));

            // Șterge mașinile pe baza ID-urilor
            carsBean.deleteCarsByIds(carIds);
        }

        // Redirecționează către pagina de listare a mașinilor
        response.sendRedirect(request.getContextPath() + "/Cars");
    }
}
