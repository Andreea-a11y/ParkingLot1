<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<jsp:useBean id="editCarForm" class="com.example.dto.CarDto" scope="request"/>


<main class="container">
  <h1>Edit Car</h1>
  <form action="${pageContext.request.contextPath}/EditCar" method="POST">


    <div class="form-group">
      <label for="license_plate">License Plate</label>
      <input type="text" class="form-control" id="license_plate" name="license_plate" required>
      <div class="invalid-feedback">
        License Plate is required.
      </div>
    </div>


    <div class="form-group">
      <label for="parking_spot">Parking Spot</label>
      <input type="text" class="form-control" id="parking_spot" name="parking_spot" required>
      <div class="invalid-feedback">
        Please provide a parking spot.
      </div>
    </div>


    <div class="form-group">
      <label for="owner_id">Owner</label>
      <select class="custom-select d-block w-100" id="owner_id" name="owner_id" required>
        <option value="">Choose...</option>
        <c: forEach var="user" items="${users}" varStatus="status">
          <option value ="${user.id}" ${car.ownerName eq user.username ? 'selected' : ''}> ${user.username}</option>
        </c:>

        <option value="1">Owner 1</option>
        <option value="2">Owner 2</option>
      </select>
      <div class="invalid-feedback">
        Please choose an owner.
      </div>
    </div>
 <hr class="mb-4">
 <input type="hidden" name="car_id" value="${car.id}"/>

    <button type="submit" class="btn btn-primary btn-lg">Save</button>
  </form>
</main>
