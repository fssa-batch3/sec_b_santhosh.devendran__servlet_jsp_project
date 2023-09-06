<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>search flight</title>

<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
   
    height: 100vh;
}

h2 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

form {
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    padding: 20px;
    width: 300px;
    margin: 0 auto;
}

label {
    font-weight: bold;
    color: #333;
    display: block;
    margin-bottom: 5px;
}

input[type="text"],
select,
input[type="date"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-bottom: 10px;
}

button[type="submit"] {
    display: block;
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.2s;
}

button[type="submit"]:hover {
    background-color: #0056b3;
}
</style>

</head>
<body>
<jsp:include page="header.jsp" />
	<h2>Enter Source and Destination</h2>
	<form action="result" method="post">
		<div>
    <label for="source">Source:</label>
    <select id="source" name="source" required>
        <option value="Chennai">Chennai</option>
        <option value="Coimbatore">Coimbatore</option>
        <option value="Hyderabad">Hyderabad</option>
        <option value="Vijayawada">Vijayawada</option>
        <option value="Jaipur">Jaipur</option>
        <option value="Udaipur">Udaipur</option>
        <option value="Kolkata">Kolkata</option>
        <option value="Patna">Patna</option>
        <option value="Lucknow">Lucknow</option>
        <option value="Varanasi">Varanasi</option>
        <option value="Mumbai">Mumbai</option>
        <option value="Pune">Pune</option>
        <option value="Delhi">Delhi</option>
        <option value="Amritsar">Amritsar</option>
        <option value="Bengaluru">Bengaluru</option>
        <option value="Guwahati">Guwahati</option>
        <option value="Imphal">Imphal</option>
        <option value="Ahmedabad">Ahmedabad</option>
        <option value="Vadodara">Vadodara</option>
        <option value="Bhopal">Bhopal</option>
        <option value="Indore">Indore</option>
        <option value="Ranchi">Ranchi</option>
        <option value="Bhubaneswar">Bhubaneswar</option>
        <option value="Nagpur">Nagpur</option>
        <option value="Raipur">Raipur</option>
        <option value="Jodhpur">Jodhpur</option>
        <option value="Kochi">Kochi</option>
        <option value="Tiruchirappalli">Tiruchirappalli</option>
        <option value="Tirupati">Tirupati</option>
        <option value="Shillong">Shillong</option>
        <option value="Silchar">Silchar</option>
        <option value="Srinagar">Srinagar</option>
        <option value="Surat">Surat</option>
        <option value="Tuticorin">Tuticorin</option>
        <option value="Port-Blair">Port-Blair</option>
        <option value="Prayagraj">Prayagraj</option>
        <option value="Vishakhapatnam">Vishakhapatnam</option>
        <option value="North Goa">North Goa</option>
        <option value="Pantnagar">Pantnagar</option>
        <option value="Kadapa">Kadapa</option>
        <option value="Kannur">Kannur</option>
        <option value="Visakhapatnam">Visakhapatnam</option>
        <option value="Itanagar">Itanagar</option>
        <option value="Kolhapur">Kolhapur</option>
        <option value="Ludhiana">Ludhiana</option>
        <option value="Mangaluru">Mangaluru</option>
        <option value="Madurai">Madurai</option>
        <option value="Nanded">Nanded</option>
        <option value="Shirdi">Shirdi</option>
        <option value="Thiruvananthapuram">Thiruvananthapuram</option>
    </select>
</div>
<div>
    <label for="destination">Destination:</label>
    <select id="destination" name="destination" required>
        <option value="Chennai">Chennai</option>
        <option value="Coimbatore">Coimbatore</option>
        <option value="Hyderabad">Hyderabad</option>
        <option value="Vijayawada">Vijayawada</option>
        <option value="Jaipur">Jaipur</option>
        <option value="Udaipur">Udaipur</option>
        <option value="Kolkata">Kolkata</option>
        <option value="Patna">Patna</option>
        <option value="Lucknow">Lucknow</option>
        <option value="Varanasi">Varanasi</option>
        <option value="Mumbai">Mumbai</option>
        <option value="Pune">Pune</option>
        <option value="Delhi">Delhi</option>
        <option value="Amritsar">Amritsar</option>
        <option value="Bengaluru">Bengaluru</option>
        <option value="Guwahati">Guwahati</option>
        <option value="Imphal">Imphal</option>
        <option value="Ahmedabad">Ahmedabad</option>
        <option value="Vadodara">Vadodara</option>
        <option value="Bhopal">Bhopal</option>
        <option value="Indore">Indore</option>
        <option value="Ranchi">Ranchi</option>
        <option value="Bhubaneswar">Bhubaneswar</option>
        <option value="Nagpur">Nagpur</option>
        <option value="Raipur">Raipur</option>
        <option value="Jodhpur">Jodhpur</option>
        <option value="Kochi">Kochi</option>
        <option value="Tiruchirappalli">Tiruchirappalli</option>
        <option value="Tirupati">Tirupati</option>
        <option value="Shillong">Shillong</option>
        <option value="Silchar">Silchar</option>
        <option value="Srinagar">Srinagar</option>
        <option value="Surat">Surat</option>
        <option value="Tuticorin">Tuticorin</option>
        <option value="Port-Blair">Port-Blair</option>
        <option value="Prayagraj">Prayagraj</option>
        <option value="Vishakhapatnam">Vishakhapatnam</option>
        <option value="North Goa">North Goa</option>
        <option value="Pantnagar">Pantnagar</option>
        <option value="Kadapa">Kadapa</option>
        <option value="Kannur">Kannur</option>
        <option value="Visakhapatnam">Visakhapatnam</option>
        <option value="Itanagar">Itanagar</option>
        <option value="Kolhapur">Kolhapur</option>
        <option value="Ludhiana">Ludhiana</option>
        <option value="Mangaluru">Mangaluru</option>
        <option value="Madurai">Madurai</option>
        <option value="Nanded">Nanded</option>
        <option value="Shirdi">Shirdi</option>
        <option value="Thiruvananthapuram">Thiruvananthapuram</option>
    </select>
</div>
<div>
    <label for="date">Date:</label>
    <input type="date" id="date" name="date" required>
</div>



		<div>
			<button type="submit">Submit</button>
		</div>
	</form>
	
<%String message=(String)session.getAttribute("alertMessage");
if(message != null){

%>
<script type="text/javascript">
	alert('<%=message%>');
</script>
<%
session.removeAttribute("alertMessage");
} %>
</body>


</html>