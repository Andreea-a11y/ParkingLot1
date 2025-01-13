<form className="needs-validation" noValidate>
    <div className="row g-3">
        <div className="col-sm-6">
            <label htmlFor="firstName" className="form-label">First name</label>
            <input type="text" className="form-control" id="firstName" placeholder="" value="" required/>
            <div className="invalid-feedback">
                Valid first name is required.
            </div>
        </div>
    </div>


    <jsp:include page="/WEB-INF/pages/menu.jsp"/>
    <main className="container-fluid mt-5">

    </main>
    <jsp:include page="/WEB-INF/pages/footer.jsp"/>

</form>


<script src="${pageContext.request.contextPath}/scripts/form-validation.js"></script>


