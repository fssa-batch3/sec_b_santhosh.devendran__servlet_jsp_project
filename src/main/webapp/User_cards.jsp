<!DOCTYPE html>
<html>
<head>
    <title>User Card</title>
   <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    
    .card {
    max-width: 300px;
    margin: auto;
    margin-top: 20rem;
    padding: 30px;
    background-color: lightgray;
    border-radius: 15px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    
    .card h2 {
        margin-top: 0;
        color: #333;
        font-size: 24px;
    }
    
    .user-info {
        margin-top: 20px;
        padding: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f9f9f9;
    }
    
    .user-info p {
        margin: 0;
        padding: 5px 0;
    }
</style>

</head>
<body>
    <div class="card">
        <h2>User Card</h2>
        <div class="user-info">
            <c:choose>
              
                    <p><strong>First Name:</strong> ${user.firstname}</p>
                    <p><strong>Last Name:</strong> ${user.lastname}</p>
                    <p><strong>Mobile No:</strong> ${user.mobileNo}</p>
                    <p><strong>Email:</strong> ${user.email}</p>
                    <p><strong>ID:</strong> ${user.id}</p>
             
            </c:choose>
        </div>
    </div>
</body>
</html>
