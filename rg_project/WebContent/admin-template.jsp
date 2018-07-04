	<%@ include file="adminses.jsp" %>
   <div class="banner">
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <a class="navbar-brand" href="#">RG Inventory</a>
            <!-- <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
              <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
              </li>
            </ul> -->
          </div>
        </nav>
  </div>
   <div class="container-fluid">
      <div class="row">
         <div class="col-2" id="side-menu">
            <div class="links" id="side">
               <div class="linkitem"><a href="AdminPreprocess">Add Admin</a></div>
               <div class="linkitem"><a href="ViewAdmins">View Admin</a></div>
               <div class="linkitem"><a href="UserRegPreprocess">Add User</a></div>
               <div class="linkitem"><a href="ViewUsers">View User</a></div>
               <div class="linkitem"><a href="ItemsPreprocess">Add Item</a></div>
               <div class="linkitem"><a href="search_item.jsp">Search Item</a></div>
               <div class="linkitem"><a href="updatestock.jsp">Update Stock</a></div>
               <div class="linkitem"><a href="ViewTransaction">Manage Transaction</a></div>
               <div class="linkitem"><a href="ManageIntent">Approve Intent</a></div>
            </div>
         </div>