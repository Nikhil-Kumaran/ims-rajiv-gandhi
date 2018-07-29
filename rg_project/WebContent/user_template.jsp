	<%@ include file="userses.jsp" %>
   <div class="banner">
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <a class="navbar-brand" href="#">Rajiv Gandhi Inventory Management System</a>
             <ul class="navbar-nav mr-right mt-2 mt-lg-0">
             
              <li class="nav-item">
              	
                <a class="nav-link" href="logout.jsp" id="logout">Logout<span class="sr-only">(current)</span></a>
              </li>
              
            </ul>
          </div>
        </nav>
  </div>
   <div class="container-fluid">
      <div class="row">
         <div class="col-2" id="side-menu">
            <div class="links" id="side">
               <div class="linkitem"><a href="user-search_item.jsp">Search Items</a></div>
               <div class="linkitem"><a href="newintent.jsp">Intent (ORDER)</a></div>
               <div class="linkitem"><a href="MyCart.jsp">My Cart</a></div>
               <div class="linkitem"><a href="MyTransactions">My Transactions</a></div>
               <div class="linkitem"><a href="complaintredirect.jsp">New Complaints</a></div>
               <div class="linkitem"><a href="ComplaintStatusView">Complaints Status</a></div>
               <div class="linkitem"><a href="returnredirect.jsp">Return Item</a></div>
               <div class="linkitem"><a href="returnstatus.jsp">Return Status</a></div>
            </div>
         </div>