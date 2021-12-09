<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Online Music Store</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body style="background-color: #B2D8E0">

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
				style="background-color: #191970">
  			<a class="navbar-brand" href="http://localhost:8090/Instrument_Payment/list">
  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			American Musical Supply</a>
  

  			<div class="collapse navbar-collapse" id="navbarSupportedContent">
    			<ul class="navbar-nav mr-auto">
					<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Payment</a></li>
				</ul>
  			</div>
		</nav>
	</header>
	<br>
	
	<div class="container col-md-5" >
		<div class="card">
			<div class="card-body">
				<c:if test="${payment != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${payment == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h3>
						<c:if test="${payment != null}">
            			Edit Payment
            		</c:if>
						<c:if test="${payment == null}">
            			New Payment
            		</c:if>
					</h3>
				</caption> <br>

				<c:if test="${payment != null}">
					<input type="hidden" name="id" value="<c:out value='${payment.id}' />" />
				</c:if>

				<div class="form-group" >
                               <label>Instrument</label>
                                <select id="inputState"  class="form-control" name="instrument" required style="background-color: #E5E4E2">
                                    <option selected disabled>Choose the Instrument</option>
                                    <option value="Guitar">Guitar</option>
                                    <option value="Violin">Violin</option>
                                    <option value="Piano">Piano</option>
                                    <option value="Double Bass Drum">Double Bass Drum</option>
                                    <option value="Saxophone">Saxophone</option>
                                    <option value="Cymbals">Cymbals</option>
                                </select>
                            </div>
                            
                            <fieldset class="form-group">
					<label>Name on Card</label> <input type="text"
						value="<c:out value='${payment.name}' />" class="form-control"
						name="name" required="required" style="background-color: #E5E4E2">
				</fieldset>
				
				
				<fieldset class="form-group">
					<label>Card No</label> <input type="text"
						value="<c:out value='${payment.card}' />" class="form-control"
						name="card" required="required" style="background-color: #E5E4E2">
				</fieldset>
				
				
				<fieldset class="form-group">
					<label>CVV</label> <input type="text"
						value="<c:out value='${payment.cvv}' />" class="form-control"
						name="cvv" pattern="[0-9]{3}" required="required" style="background-color: #E5E4E2">
				</fieldset>
                            
                            
                            <fieldset class="form-group">
					<label>Expire Date</label> <input type="date"
						value="<c:out value='${payment.expire}' />" class="form-control"
						name="expire" required="required" style="background-color: #E5E4E2">
				</fieldset>
                            

				<fieldset class="form-group">
					<label>Amount</label> <input type="text"
						value="<c:out value='${payment.amount}' />" class="form-control"
						name="amount" required="required" style="background-color: #E5E4E2">
				</fieldset>



				<button type="submit" class="btn btn-Success">Save</button>
				<button type="button" class="btn btn-warning"> <a href="http://localhost:8090/Instrument_Payment/"> Cancel </a> </button>
				</form>
				</div>
			</div>
		<br>
	</div>
	
	<footer >
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #292929">
			<table style="color:white; width:100%; border:0px; " >
			<tr>
				<th style="width:38%;"> Infront of SLIIT Malabe Campus, <br>
					American Musical Supply,<br>
				    New Kandy Rd, <br>
				    Malabe 10115.<br>
				</th>
				<th style="width:35%">Thank you for visiting our web page. <br><br>
				
				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
				<a href="https://www.facebook.com/" class="fa fa-facebook"></a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="https://twitter.com/?lang=en" class="fa fa-twitter"></a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="https://lk.linkedin.com/" class="fa fa-linkedin"></a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="https://www.youtube.com/" class="fa fa-youtube"></a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="https://www.instagram.com/" class="fa fa-instagram"></a>
				</th>
				
				<th style="width:25%"><br>Privacy Policy<br>
				Terms & Conditions<br>
				Disclaimer<br>
				Contact<br><br>
				</th>
			</tr>
			
			<tr style="background-color:red;"> 
				<th style="text-align:center;" colspan="3"><br> ©  Copyright 2021 <br><br>
				</th>
			</tr>
			</table>
			
		</nav>
	</footer>
</body>
</html>