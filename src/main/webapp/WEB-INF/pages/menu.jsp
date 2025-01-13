<header>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Parking Lot</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href=${pageContext.request.contextPath}>About</a>
            ${pageContext.request.requestURI.substring(pageContext.request.requestURI.lastIndexOf
                    ("/")) eq '/about.jsp' ? ' active' : ''}
          </li>
          <li class="nav-item">
            <c:if test="${pageContext.request.isUserInRole('READ_CARS')}">
              <a class="nav-link active" aria-current="page" href=${pageContext.request.contextPath}/Cars>Cars
              ${pageContext.request.requestURI.substring(pageContext.request.requestURI.lastIndexOf
                    ("/")) eq '/cars.jsp' ? ' active' : ''}
              aria-current="page" href="${pageContext.request.contextPath}/Cars">Cars</a>
            </c:if>

          </li
          <li class="nav-item">
            <c:if test="${pageContext.request.isUserInRole('READ_CARS')}">
              <a class="nav-link active" aria-current="page" href=${pageContext.request.contextPath}/Users>Users
                  ${pageContext.request.requestURI.substring(pageContext.request.requestURI.lastIndexOf
                          ("/")) eq '/users.jsp' ? ' active' : ''}
                aria-current="page" href="${pageContext.request.contextPath}/Users">Users</a>
            </c:if>

          </li

          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/about.jsp">Link</a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled">Disabled</a>
          </li>

        </ul>
        <ul class="navbar-nav">
          <li class="nav-item">
            <c:choose>
              <c:when test="${pageContext.request.getRemoteUser() == null}">
                <a class="nav-link" href="${pageContext.request.contextPath}/Login">Login</a>
              </c:when>
              <c:otherwise>
                <a class="nav-link" href="${pageContext.request.contextPath}/Logout">Logout</a>
              </c:otherwise>
            </c:choose>
            <a class="nav-link"href=" ${pageContext.request.contextPath}/Login">Login</a>
          </li>
        </ul>
        <ul>
          <li><a href="/Users">Users</a></li>
          <!-- alte intrări din meniu -->
        </ul>
      </div>
    </div>
  </nav>
</header>
<ul>
  <li><a href="cars.jsp">Cars</a></li>
  <li><a href="users.jsp">Users</a></li>
</ul>